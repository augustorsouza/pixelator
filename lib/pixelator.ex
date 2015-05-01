defmodule Pixelator do
  defp pixelize_images_in_dir(dir, level) do
    {return, files} = Path.expand(dir) |> File.ls

    if return == :ok do
      image_files = Enum.map(files, &([Path.expand(dir), &1] |> Path.join))
      |> Enum.filter(&(Path.extname(&1) == ".png" || Path.extname(&1) == ".jpg"))

      IO.puts "*******************"
      IO.puts "List of images we are going to pixelate:\n-#{image_files |> Enum.join("\n-")}"
      IO.puts "*******************\n"

      output_dir = [Path.expand(dir), "pixelated"] |> Path.join
      output_dir |> File.mkdir_p

      image_files |> Enum.each(fn(image) ->
        {image_properties, _} = System.cmd("identify", [image], [])
        [_, _, image_original_size | _] = image_properties |> String.split(" ")

        pixelized_image = [output_dir, Path.basename(image)] |> Path.join

        args = ~w(-scale #{100/level}% -scale #{100*level}% -resize #{image_original_size}! #{image} #{String.replace(pixelized_image, " ", "\\ ")})
        System.cmd "convert", args, stderr_to_stdout: true

        IO.puts "#{pixelized_image} generated!"
      end)

      IO.puts "\nFinished with success!\n"
    else
      IO.puts "Failed to retrieve file from dir #{Path.expand(dir)}"
    end
  end

  def main(args) do
    {[dir: dir, level: level], _, _} = OptionParser.parse(args)

    pixelize_images_in_dir(dir, String.to_integer(level))
  end
end
