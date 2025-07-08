function [data, auxData, metaData, txtData, weights] = mydata_Chlorophthalmus_agassizi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Chlorophthalmidae';
metaData.species    = 'Chlorophthalmus_agassizi'; 
metaData.species_en = 'Shortnose greeneye'; 

metaData.ecoCode.climate = {'MB','MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2020 10 06]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 06]; 

%% set data
% zero-variate data
data.am = 13*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'AnasPapa2006';  
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'CabiFoll2010';
data.Li = 40;     units.Li = 'cm';   label.Li = 'ultimate total length for males'; bibkey.Li = 'fishbase';

data.Wwb = 2.4e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'CabiFoll2010';
  comment.Wwb = 'based on egg diameter of 356.6 mum: pi/6*0.0356^3';
data.Wwi = 461; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = {'fishbase','AnasPapa2006'};
  comment.Wwi = 'based on 0.0000026*(10*Li)^3.17, see F2';

data.GSI  = 0.035; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI  = 'CabiFoll2010';   
temp.GSI = C2K(8);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % age (yr), total length (cm) 
    0  6.30
    1  8.31
    2 10.87
    3 12.34
    4 13.86
    5 15.06
    6 15.86
    7 16.92
    8 17.48
    9 17.80
   10 18.00
   11 18.58
   12 18.66];
data.tL(:,1) = 365 * (1 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AnasPapa2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Peferred temperature 5-13 C in deep water';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'weight-length: Ww in g =  0.0000026*(TL in mm)^3.17';
metaData.bibkey.F2 = 'AnasPapa2006'; 
F3 = 'Herpmaphroditic';
metaData.bibkey.F2 = 'PareGrie2015'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '69XP7'; % Cat of Life
metaData.links.id_ITIS = '162430'; % ITIS
metaData.links.id_EoL = '46563721'; % Ency of Life
metaData.links.id_Wiki = 'Chlorophthalmus'; % Wikipedia
metaData.links.id_ADW = 'Chlorophthalmus_agassizi'; % ADW
metaData.links.id_Taxo = '154140'; % Taxonomicon
metaData.links.id_WoRMS = '126336'; % WoRMS
metaData.links.id_fishbase = 'Chlorophthalmus-agassizi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathypterois_dubius}}';
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
bibkey = 'AnasPapa2006'; type = 'incollection'; bib = [ ...
'author = {Aikaterini (Katerina) Anastasopoulou and Constantinos Papaconstantinou}, ' ... 
'year   = {2006}, ' ...
'title  = {Age and growth of \emph{Chlorophthalmus agassizi} ({B}. 1840) in ten {I}onian {S}ea}, ' ...
'booktitle = {8th Hel. Symp. Oceanogr. \& Fish. in Thessaloniki, greeceVolume: Book of Abstracts}, ' ...
'pages = {212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PareGrie2015'; type = 'article'; bib = [ ...
'author = {Lynne R. Parenti and Harry J. Grier and MariCarmen Uribe}, ' ... 
'year   = {2015}, ' ...
'title  = {Reproductive Biology of \emph{Chlorophthalmus agassizi} {B}onaparte, 1840 ({T}eleostei: {A}ulopiformes: {C}hlorophthalmidae) as Revealed through Histology of Archival Museum Specimens}, ' ...
'journal = {Copeia}, ' ...
'page = {821-837}, ' ...
'volume = {2015(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CabiFoll2010'; type = 'article'; bib = [ ...
'doi = {10.3750/AIP2010.40.2.10}, ' ...
'author = {Serenella Cabiddu and Maria Cristina Follesa and Cristina Porcu and Angelo Cau}, ' ... 
'year   = {2010}, ' ...
'title  = {GONAD DEVELOPMENT AND REPRODUCTION IN THE MONOECIOUS SPECIES \emph{Chlorophthalmus agassizi} ({A}CTINOPTERYGII: {A}ULOPIFORMES: {C}HLOROPHTHALMIDAE) FROM THE {S}ARDINIAN WATERS (CENTRAL-WESTERN {M}EDITERRANEAN)}, ' ...
'journal = {ACTA ICHTHYOLOGICA ET PISCATORIA}, ' ...
'page = {167-177}, ' ...
'volume = {40(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathypterois-dubius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

