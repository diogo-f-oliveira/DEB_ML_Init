function [data, auxData, metaData, txtData, weights] = mydata_Hapalochlaena_maculosa

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Hapalochlaena_maculosa'; 
metaData.species_en = 'Blue-ringed octopus'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSE','MIN'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 04 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 14]; 

%% set data
% zero-variate data

data.ab = 60;   units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'TranAugu1973';   
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 213;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'TranAugu1973';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki gives 2 yrs';

data.Lb  = 0.35;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';     bibkey.Lb  = 'TranAugu1973';
data.Lp  = 4;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';     bibkey.Lp  = 'TranAugu1973';
data.Li  = 5.7;  units.Li  = 'cm'; label.Li  = 'mantle length at death';     bibkey.Li  = 'sealifebase';

data.Wwi  = 29;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'ADW';

data.Ni  = 250; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'TranAugu1973';   
  temp.Ni = C2K(22);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'Wiki gives 50';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
0.429	0.356
3.218	0.424
12.871	0.552
30.033	0.739
49.554	1.156
54.488	1.334
63.713	1.394
76.799	1.691
87.310	1.989
97.822	2.489
105.974	2.998
111.337	3.473
118.201	3.711
128.284	3.983];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TranAugu1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'End of acceleration is assumed to coincide with puberty';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing; virulent toxin (tetrodotoxin) is secreted by the large posterior salivary glands';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'no plantonic stage';
metaData.bibkey.F2 = 'TranAugu1973'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6LBGH'; % Cat of Life
metaData.links.id_ITIS = '556175'; % ITIS
metaData.links.id_EoL = '591395'; % Ency of Life
metaData.links.id_Wiki = 'Hapalochlaena_maculosa'; % Wikipedia
metaData.links.id_ADW = 'Hapalochlaena_maculosa'; % ADW
metaData.links.id_Taxo = '158329'; % Taxonomicon
metaData.links.id_WoRMS = '342334'; % WoRMS
metaData.links.id_molluscabase = '342334'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hapalochlaena_maculosa}}';
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
bibkey = 'TranAugu1973'; type = 'article'; bib = [ ... 
'author = {D. J. Tranter and O. Augustine}, ' ... 
'year = {1973}, ' ...
'title = {Observations on the Life History of the Blue-Ringed Octopus \emph{Hapalochlaena maculosa}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {18}, ' ...
'pages = {115--128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Hapalochlaena-maculosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Hapalochlaena_maculosa/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

