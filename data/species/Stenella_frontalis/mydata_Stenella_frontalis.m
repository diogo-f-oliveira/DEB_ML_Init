function [data, auxData, metaData, txtData, weights] = mydata_Stenella_frontalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Stenella_frontalis'; 
metaData.species_en = 'Atlantic spotted dolphin'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 19]; 

%% set data
% zero-variate data

data.tg = 350;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 3*365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'EoL';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 8*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'EoL';   
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'EoL: 8 till 15 yrs';
data.am = 38*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 90; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'Wiki';
  comment.Lb = 'Wiki: 89 till 109 cm';
data.Li = 220; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'SiciRamo2007';

data.Wwi = 140e3; units.Wwi = 'g'; label.Wwi = 'ultimate weight'; bibkey.Wwi = 'Wiki';

data.Ri  = 0.3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'inter calving period 1 till 5 yrs with a mean of 3 yrs';
  
% uni-variate data
% time-length data
data.tL = [ % time since birth (yr), length (cm)
0.875	136.865
1.833	151.622
1.875	144.253
2.792	157.309
2.833	170.348
3.917	155.063
4.875	161.884
4.917	171.521
5.833	187.412
7.000	164.191
8.792	186.901
8.833	174.997
8.833	194.838
9.875	216.400
9.958	196.560
10.708	213.014
10.750	222.085
10.833	188.073
11.875	197.163
11.875	207.367
22.833	217.778]; 
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SiciRamo2007';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from femals';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6ZJCX'; % Cat of Life
metaData.links.id_ITIS = '552460'; % ITIS
metaData.links.id_EoL = '46559284'; % Ency of Life
metaData.links.id_Wiki = 'Stenella_frontalis'; % Wikipedia
metaData.links.id_ADW = 'Stenella_frontalis'; % ADW
metaData.links.id_Taxo = '68737'; % Taxonomicon
metaData.links.id_WoRMS = '137108'; % WoRMS
metaData.links.id_MSW3 = '14300090'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stenella_frontalis}}';
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
bibkey = 'SiciRamo2007'; type = 'article'; bib = [ ... 
'author = {S. Siciliano and R. M. A. Ramo and A. P. M. Di Beneditto and M. C. O. Santos and A. B. Fragoso and J. L. Brito and A. F. Azevedo and A. F. C. Vicente and E. Zampirolli and F. S. Alvarenga and L. Barbosa and N. R. W. Lima}, ' ... 
'year = {2007}, ' ...
'title = {Age and growth of some delphinids in south-eastern {B}razil}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'doi = {10.1017/S0025315407053398}, ' ...
'volume = {87}, ' ...
'pages = {293--303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1035713/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

