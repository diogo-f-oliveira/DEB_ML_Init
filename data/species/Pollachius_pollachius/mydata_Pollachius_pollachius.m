function [data, auxData, metaData, txtData, weights] = mydata_Pollachius_pollachius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Pollachius_pollachius'; 
metaData.species_en = 'Pollack'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.9); % in K, body temp
metaData.data_0     = {'ab';'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-Ww';'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 29];

%% set data
% zero-variate data
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'fishbase';    
  temp.ab = C2K(9.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Pollachius virens';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                     bibkey.am = 'Wiki';  
  temp.am = C2K(8.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 41;   units.Lp = 'cm';   label.Lp = 'total length at puberty';            bibkey.Lp = 'fishbase';
data.Li = 130;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.15 mm for Pollachius virens: pi/6*0.115^3';
data.Wwp = 657;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00708*Lp^3.08, see F4';
data.Wwi = 18100; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';   

data.GSI = 0.07; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'AlonVill2013';
  temp.GSI = C2K(8.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr) , total length (cm)
0.5	17.772
1	23.323
2	34.636
3	41.580
4	47.350
5	51.734
6	54.306
7	56.771
8	57.211];
data.tL(:,1) = 365 * (0.95+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(8.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HeinSvas2012';

% time-weight
data.tW = [ ... % time (d) , weight (g)
0.000	143.700
14.992	158.501
28.012	169.747
41.839	186.692
57.398	199.545
70.425	213.818
84.238	225.421];
units.tW = {'d', 'g'}; label.tW = {'time', 'weight'};  
temp.tW = C2K(12);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PersBuch2006';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 5 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Preferred temperature 6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Females are slightly larger than males and mature later, but differences are small';
metaData.bibkey.F2 = 'ICES'; 
F3 = 'Semi-pelagic species that is not bound to a demersal life style';
metaData.bibkey.F3 = 'ICES'; 
F4 = 'Length-Weight relationship: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '4KYQ7'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46564427'; % Ency of Life
metaData.links.id_Wiki = 'Pollachius_pollachius'; % Wikipedia
metaData.links.id_ADW = 'Pollachius_pollachius'; % ADW
metaData.links.id_Taxo = '44350'; % Taxonomicon
metaData.links.id_WoRMS = '126440'; % WoRMS
metaData.links.id_fishbase = 'Pollachius-pollachius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pollachius_pollachius}}';
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
bibkey = 'PersBuch2006'; type = 'article'; bib = [ ...
'doi = {10.1016/j.aquaculture.2005.06.029}, ' ...
'author = {J. Person-Le Ruyet and V. Buchet and B. Vincent and H. Le Delliou and L. Qu\''{e}m\''{e}ner}, ' ... 
'year   = {2006}, ' ...
'title  = {Effects of temperature on the growth of pollack (\emph{Pollachius pollachius}) juveniles}, ' ...
'journal = {Aquaculture}, ' ...
'page = {340–345}, ' ...
'volume = {251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeinSvas2012'; type = 'article'; bib = [ ...
'doi = {10.1093/icesjms/fss043}, ' ...
'author = {Mikko Heino and Terje Sv{\aa}sand and Jarle Tryti Nordeide and H{\aa}kon Ottera}, ' ... 
'year   = {2012}, ' ...
'title  = {Seasonal dynamics of growth and mortality suggest contrasting population structure and ecology for cod, pollack, and saithe in a {N}orwegian fjord}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'page = {537–546}, ' ...
'volume = {69(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlonVill2013'; type = 'article'; bib = [ ...
'doi = {10.1017/s0025315413000283}, ' ...
'author = {Alonso-Fern\''{a}ndez, Alexandre and Villegas-R\''{i}os, David and Vald\''{e}s-L\''{o}pez, Marta and Olveira-Domínguez, Beatriz and Saborido-Rey, Fran}, ' ... 
'year   = {2013}, ' ...
'title  = {Reproductive biology of pollack (\emph{Pollachius pollachius}) from the {G}alician shelf (north-west {S}pain)}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'page = {1951–1963}, ' ...
'volume = {93(7)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pollachius-pollachius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

