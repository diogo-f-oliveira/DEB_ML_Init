function [data, auxData, metaData, txtData, weights] = mydata_Mamenchisaurus_spec

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Saurischia'; 
metaData.family     = 'Mamenchisauridae';
metaData.species    = 'Mamenchisaurus_spec'; 
metaData.species_en = 'Mamenchisaurus'; 

metaData.ecoCode.climate = {'BS'};
metaData.ecoCode.ecozone = {'THp'};
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
metaData.date_subm = [2016 10 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 30]; 

%% set data
% zero-variate data

data.tp = 20*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GrieKlei2013';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 100*365;    units.am = 'd';    label.am = 'life span';                  bibkey.am = 'learning';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 10e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'learning';
  comment.Wwb = 'Very speculative; egg is 30 cm long, and if sphearical, this amounts to 10 kg';
data.Wwi = 30e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'GrieKlei2013';
  comment.Wwi = 'Wiki mentions up to 50 and 75 tons';
  
data.Ri  = 30/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Very speculative';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (yr), wet weight (kg)
9.991	2491.726
10.967	5616.902
11.941	7799.927
12.972	8693.767
13.883	9835.393
14.793	11026.605
15.825	12019.618
16.917	13161.467
18.009	14452.078
18.920	15742.463
19.893	17380.033
20.925	18670.568
21.957	20209.039
22.991	22094.617
23.840	22938.646
24.931	23535.039
25.899	23734.587
26.869	24082.896
27.958	24332.180
29.048	24631.052
30.017	24781.014
31.047	25129.397];
units.tW   = {'yr', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'GrieKlei2013';
comment.tW = 'Temperature is speculative; weights reconstructured from bone lengths';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Several data are very speculative, such as T, Wwb, Ri';
D2 = 'Neonate growth is possibly retarted by lower body temperature';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Extinct, lived 160 till 145 Ma ago';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '47459136'; % Ency of Life
metaData.links.id_Wiki = 'Mamenchisaurus'; % Wikipedia
metaData.links.id_Taxo = '50894'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mamenchisaurus}}';
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

