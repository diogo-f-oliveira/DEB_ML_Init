function [data, auxData, metaData, txtData, weights] = mydata_Sepietta_obscura

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiolida'; 
metaData.family     = 'Sepiolidae';
metaData.species    = 'Sepietta_obscura'; 
metaData.species_en = 'Mysterious bobtail squid'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 45;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BoleBole1971';   
  temp.ab = C2K(16.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 115;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BoleBole1971';
  temp.tp = C2K(16.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'from growth curve L(ap) = Lp';
data.am = 230;    units.am = 'd';    label.am = 'life span';                bibkey.am = '';   
  temp.am = C2K(16.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;   units.Lb  = 'cm';  label.Lb  = 'mantle length at birth';   bibkey.Lb  = 'BoleBole1971';
data.Lp  = 1.6;   units.Lp  = 'cm';  label.Lp  = 'mantle length at puberty'; bibkey.Lp  = 'BoleBole1971';
data.Li  = 2.4;   units.Li  = 'cm';  label.Li  = 'ultimate mantle length';   bibkey.Li  = 'BoleBole1971';

data.Wwb = 0.004; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on (Lb/2)^3 * 4, since Sepiola atlantica weighs 4 g at mantle length 2 cm';
data.Wwp = 2.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/2)^3 * 4, since Sepiola atlantica weighs 4 g at mantle length 2 cm';
data.Wwi = 6.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on (Li/2)^3 * 4, since Sepiola atlantica weighs 4 g at mantle length 2 cm';

data.Ni  = 125;   units.Ni  = '#'; label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'BoleBole1971';   
  temp.Ni = C2K(16.5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
0.114	0.215
6.328	0.250
16.078	0.281
25.415	0.364
34.308	0.447
43.635	0.513
52.072	0.569
72.072	0.736
82.322	0.872
91.215	0.955
111.365	1.403
118.514	1.535
147.963	1.996
178.153	2.188
193.728	2.355];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BoleBole1971';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4WQS6'; % Cat of Life
metaData.links.id_ITIS = '557025'; % ITIS
metaData.links.id_EoL = '46475535'; % Ency of Life
metaData.links.id_Wiki = 'Sepietta'; % Wikipedia
metaData.links.id_ADW = 'Sepietta_obscura'; % ADW
metaData.links.id_Taxo = '580637'; % Taxonomicon
metaData.links.id_WoRMS = '141451'; % WoRMS
metaData.links.id_molluscabase = '141451'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sepietta_obscura}}';
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
bibkey = 'BoleBole1971'; type = 'Article'; bib = [ ... 
'author = {Boletzky, S. von and Boletzky, V. von and Froesch, D. and Gaetzi, V.}, ' ... 
'year = {1971}, ' ...
'title = {Laboratory rearing of \emph{Sepiolinae} ({M}ollusca: {C}ephalopoda)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {8}, ' ...
'pages = {82--87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

