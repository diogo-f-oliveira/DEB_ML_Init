function [data, auxData, metaData, txtData, weights] = mydata_Apatosaurus_spec

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Saurischia'; 
metaData.family     = 'Diplodocidae';
metaData.species    = 'Apatosaurus_spec'; 
metaData.species_en = 'Apatosaurus'; 

metaData.ecoCode.climate = {'BS'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 1.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 25]; 

%% set data
% zero-variate data

data.tp = 10*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GrieKlei2013';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 100*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'learning';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 10e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'learning';
  comment.Wwb = 'Very speculative; egg is 30 cm long, and if sphearical, this amounts to 10 kg';
data.Wwi = 19e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'GrieKlei2013';
  comment.Wwi = 'Concerns individual of growth data; Wiki gives upto 72e6 g for the species';
  
data.Ri  = 30/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Very speculative';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (yr), wet weight (kg)
12.867	6095.136
14.041	7939.954
14.934	10037.983
16.015	11521.073
16.955	13655.274
18.083	13836.138
18.976	15066.017
20.009	15283.054
20.949	16585.279
21.889	16874.662
22.970	17127.872
24.004	17308.737
25.038	17489.601
25.977	17706.639
27.058	17887.503
27.998	18176.886
28.985	18321.578
29.972	18321.578];
units.tW   = {'yr', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GrieKlei2013';
comment.tW = 'Temperature is speculative; weights reconstructured from bone lengths';
%
data.tW1 = [ ... % time since birth (yr), wet weight (kg)
13.947	5878.099
14.981	7650.571
15.921	9640.081
16.814	11086.997
17.942	13185.025
18.929	13329.717
19.962	14668.115
20.902	14704.287
21.983	16042.685
22.970	16368.241
24.098	16621.451
25.038	16874.662
26.118	17019.353
27.058	17236.391
27.951	17344.909
29.032	17598.120
29.972	17742.811
30.959	17742.811];
units.tW1   = {'yr', 'kg'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(37);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'GrieKlei2013';
comment.tW1 = 'Temperature is speculative; weights reconstructured from bone lengths';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.tW1 = 5 * weights.tW1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for different estimates'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D0 = 'Growth data concern specimen BYU 601-17328';
D1 = 'Several data are very speculative, such as T, Wwb, Ri';
D2 = 'Neonate growth is possibly retarted by lower body temperature';
metaData.discussion = struct('D0', D0, 'D1', D1, 'D2', D2);

%% Facts
F1 = 'Extinct, lived 154 till 150 Ma ago';
metaData.bibkey.F1 = 'livescience'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '47459350'; % Ency of Life
metaData.links.id_Wiki = 'Apatosaurus'; % Wikipedia
metaData.links.id_Taxo = '50887'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apatosaurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GrieKlei2013'; type = 'Article'; bib = [ ... 
'author = {E. M. Griebeler and N. Klein and P. M. Sander}, ' ... 
'year = {2013}, ' ...
'title = {Aging, Maturation and Growth of Sauropodomorph Dinosaurs as Deduced from Growth Curves Using Long Bone Histological Data: An Assessment of Methodological Constraints and Solution}, ' ...
'journal = {Plos One}, ' ...
'volume = {8}, ' ...
'pages = {e67012}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'livescience'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.livescience.com/25093-apatosaurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'learning'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.enchantedlearning.com/subjects/dinosaurs/dinos/Apatosaurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

