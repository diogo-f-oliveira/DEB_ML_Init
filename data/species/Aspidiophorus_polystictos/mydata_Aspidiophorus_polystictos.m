function [data, auxData, metaData, txtData, weights] = mydata_Aspidiophorus_polystictos

%% set metaData
metaData.phylum     = 'Gastrotricha'; 
metaData.class      = 'Gastrotricha'; 
metaData.order      = 'Chaetonotida'; 
metaData.family     = 'Chaetonotidae';
metaData.species    = 'Aspidiophorus_polystictos'; 
metaData.species_en = 'Hairyback'; % hairybelly would be more appropriate

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TA', 'TN', 'TP'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPn'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apo'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'L_t'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 05 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 

%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'BalsToda1987';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4.2;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'BalsToda1987';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24.6; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'BalsToda1987';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.356e-2 * 2/3; units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'BalsToda1987';
data.L5  = 1.356e-2 * 0.9; units.L5  = 'cm';  label.L5  = 'total length at 5 d';   bibkey.L5  = 'BalsToda1987';
  temp.L5 = C2K(20);  units.temp.L5 = 'K'; label.temp.L5 = 'temperature';
data.Li  = 1.356e-2;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'BalsToda1987';

data.Wwb = 2.38e-8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BalsToda1987';
data.Wwi = 8.05e-8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'BalsToda1987';

data.Ri  = 4.5/8.6;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'BalsToda1987';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = weights.Wwi * 100;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '67TBH'; % Cat of Life
metaData.links.id_ITIS = '709121'; % ITIS
metaData.links.id_EoL = '510013'; % Ency of Life
metaData.links.id_Wiki = 'Aspidiophorus'; % Wikipedia
metaData.links.id_ADW = 'Aspidiophorus_polystictos'; % ADW
metaData.links.id_Taxo = '3928276'; % Taxonomicon
metaData.links.id_WoRMS = '114471'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gastrotricha}}';
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
bibkey = 'BalsToda1987'; type = 'Article'; bib = [ ... 
'author = {Balsamo, M. and Todaro, M. A. D.}, ' ... 
'year = {1987}, ' ...
'title = {\emph{Aspidiophorus polystictos}, a new marine species ({G}astrotricha, {C}haetonoda) and its life cycle}, ' ...
'journal = {Boll. Zool.}, ' ...
'volume = {54}, ' ...
'pages = {147--153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

