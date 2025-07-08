function [data, auxData, metaData, txtData, weights] = mydata_Neophocaena_phocaenoides
%% set  metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Phocoenidae';
metaData.species    = 'Neophocaena_phocaenoides'; 
metaData.species_en = 'Finless porpoise'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPW', 'MIN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37);% K, body temperature
metaData.data_0     = {'tg'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};          
metaData.date_subm   = [2018 07 19];                  
metaData.email       = {'bas.kooijman@vu.nl'};        
metaData.address     = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 19]; 

%% set data
% zero-variate data
data.tg = 320; units.tg = 'd';  label.tg = 'gestation time';     bibkey.tg = 'AnAge';    
  temp.tg = C2K(37); units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 320; units.tx = 'd';  label.tx = 'time since birth at weaning';     bibkey.tx = 'AnAge';    
  temp.tx = C2K(37); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2190;   units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1460;   units.tpm = 'd';  label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 33*365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 72.5;      units.Lb = 'cm'; label.Lb = 'total length at birth';       bibkey.Lb = 'AnAge';
data.Lx = 101;       units.Lx = 'cm'; label.Lx = 'total length at weaning';     bibkey.Lx = 'AnAge';
data.Lp = 148;       units.Lp = 'cm'; label.Lp = 'total length at puberty';     bibkey.Lp = 'AnAge';
data.Li = 227;       units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'Wiki';

data.Wwb = 7e3;     units.Wwb = 'g'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 24.5e3;    units.Wwx = 'g'; label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 72e3;    units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Wiki';

data.Ri = 0.5/365;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length data
data.tL = [ % time since birth (yr), length (cm)
 5 125.4
 5 136.0
 5 144.0
 6 131.6
 6 138.4
 6 138.4
 7 134.5
 7 137.6
 8 135.7
 8 137.9
 9 142.5
 9 149.5
12 142.6
14 143.5
16 149.7
16 155.2
19 153.7];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeeAn2013';

% time-weight data
data.LW = [ % time since birth (yr), weight (kg)
125.4 28.2 
136.0 36.8 
131.6 48.0
138.4 39.8
138.4 49.0
134.5 35.7
137.7 32.1
135.7 48.0
137.9 37.0
142.5 52.0
149.5 39.6
142.6 64.0
143.5 45.9
149.7 42.6];
units.LW  = {'cm', 'kg'};  label.LW = {'length', 'weight'};  
bibkey.LW = 'LeeAn2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Links
metaData.links.id_CoL = '46Q8R'; % Cat of Life
metaData.links.id_ITIS = '180478'; % ITIS
metaData.links.id_EoL = '46559350'; % Ency of Life
metaData.links.id_Wiki = 'Neophocaena_phocaenoides'; % Wikipedia
metaData.links.id_ADW = 'Neophocaena_phocaenoides'; % ADW
metaData.links.id_Taxo = '68785'; % Taxonomicon
metaData.links.id_WoRMS = '254985'; % WoRMS
metaData.links.id_MSW3 = '14300110'; % MSW3
metaData.links.id_AnAge = 'Neophocaena_phocaenoides'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neophocaena_phocaenoides}}';  
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
bibkey = 'LeeAn2013'; type = 'Article'; bib = [ ...
'author = {Y. R. Lee and Y. R. An and K. J. Park and H. Sohn and D. H. An and S. A. Kim}, ' ...
'doi = {10.1080/19768354.2013.851116}, ' ...
'year   = {2013}, ' ...
'title  = {Age and reproduction of the finless porpoises, \emph{Neophocaena asiaeorientalis}, in the {Y}ellow {S}ea, {K}orea}, ' ...
'journal = {Animal Cells and Systems}, ' ...
'volume = {17}, ' ...
'number = {5}, ' ...
'pages = {366--373}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Neophocaena_phocaenoides}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
