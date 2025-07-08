function [data, auxData, metaData, txtData, weights] = mydata_Ictalurus_furcatus

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Ictalurus_furcatus'; 
metaData.species_en = 'Blue catfish'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman','Vaskar Nepal'};        
metaData.date_mod_1 = [2022 07 11];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 07 11]; 

%% set data
% zero-variate data;

data.am = 34*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'StewBenz2009';
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 59;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishesoftexas';
data.Li  = 165;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'EoL'; 
  
data.Wwb = 2.76e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishesoftexas'; 
  comment.Wwb = 'based on egg diameter of 3.75 mm for I punctatus: pi/6*0.375^3';
data.Wwp = 1.72e3;   units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishesoftexas','fishbase'}; 
  comment.Wwp = 'based on 0.00513*Lp^3.12, see F1';
data.Wwi = 68e3; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'EoL'; 

% uni-variate data

% time-length
data.tL = [ ... year class (yr), total length (inch)
    1  5.7
    2 10
    3 13.8
    4 17.4
    5 21
    6 25.8
    7 30.3
    8 34.4
    9 40.4
   10 42.1
   11 44]; 
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 2.54; % convert inch to cm
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  bibkey.tL = 'fishesoftexas';
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

LWNR = [ ...
552	565	586	604	618	624	625	626	635	642	656	679	685	739	755	763	768	780	796	804	815	853	853	873	904	925	926	944	1019	1019	1031	1056	1111	; % Length, mm
1.7	2.25	2.2	2.7	2.7	2.75	2.7	3.45	3.4	3	3.7	4.55	6.5	4.05	6.8	5.7	5.7	6.5	5.9	6.9	7.65	9.7	9.45	8.6	9.35	12.5	12.55	11	12.8	15.25	14.4	18.55	19.3	; % Weight kg
19287	17821	21790	25302	19404	30607	30520	28282	24764	36897	35570	33160	44247	36308	49726	42584	37395	50325	50167	51341	69682	65973	53086	61249	58276	81135	102621	85342	77063	75908	91638	139708	118451	; %Fecundity, #
298.1	169.3	313.6	293.5	273.9	411.9	438.5	497.6	406.3	444.7	500.4	485.4	952.1	483.9	789.1	751.7	769.9	862.4	716.2	751.7	938.2	1176.8	964.4	1362.4	996.2	1566.3	1574.5	1421	1107	1363.5	1349.5	1716.4	1881.7	]'; % Ovary weight, g
LWNR(:, 1) = LWNR(:, 1) ./ 10; % Total length in cm
LWNR(:, 2) = (LWNR(:, 2) .* 1000) - LWNR(:, 4); % Somatic wet weight in grams

% Length-weight;
data.LWw    = LWNR(:, [1 2]); 
units.LWw   = {'cm', 'g'};   label.LWw = {'Total length', 'Wet weight (somatic)'};  bibkey.LWw = 'ColeFord2020';
comment.LWw = 'Females Mississippi River (somatic weight)';

% Length-fecundity;
data.LN    = LWNR(:, [1 3]); 
units.LN   = {'cm', '#/d'};   label.LN = {'Total length', 'Fecundity'};  bibkey.LN = 'ColeFord2020';
temp.LN    = C2K(15.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
comment.LN = 'Females Mississippi River; Temp based on mean annual temp in Illinois';

% Length-Gonad weight;
data.LWwR    = LWNR(:, [1 4]); 
units.LWwR   = {'cm', 'g'};   label.LWwR = {'Total length', 'Gonad Wet weight'};  bibkey.LWwR = 'ColeFord2020';
temp.LWwR    = C2K(15.5);  units.temp.LWwR = 'K'; label.temp.LWwR = 'temperature';
comment.LWwR = 'Females Mississippi River; Temp based on mean annual temp in Illinois';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from females';
D2 = 'mod_1: am, Wwi, Li, d_V and d_E changed, Ri deleted and added LWw, LN, LWwR and grouped estimation with Ictalurus_furcatus_JR';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3PB7V'; % Cat of Life
metaData.links.id_ITIS = '163997'; % ITIS
metaData.links.id_EoL = '995103'; % Ency of Life
metaData.links.id_Wiki = 'Ictalurus_furcatus'; % Wikipedia
metaData.links.id_ADW = 'Ictalurus_furcatus'; % ADW
metaData.links.id_Taxo = '44002'; % Taxonomicon
metaData.links.id_WoRMS = '275329'; % WoRMS
metaData.links.id_fishbase = 'Ictalurus-furcatus'; % fishbase

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StewBenz2009'; type = 'Article'; bib = [ ... 
'title = {Weight–length relationships and growth data for blue catfish from four Tennessee waterbodies},'...
'volume = {63},'...
'journal = {Proceedings of the Annual Conference Southeastern Association of Fish and Wildlife Agencies},'...
'author = {Stewart, D. R. and Benz, G. W. and Scholten, G. D.},'...
'year = {2009},'...
'pages = {140-146}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ColeFord2020'; type = 'msthesis'; bib = [ ... 
'title = {Fecundity of flathead catfish and blue catfish from the {M}ississippi {R}iver between {H}annibal and {C}ape {G}irardeau, {M}issouri},'...
'author = {Colehour, Jacob D.},'...
'year = {2009},'...
'url = {http://search.proquest.com/science/docview/305066430/abstract/7701257DAAFC4958PQ/1},'...
'school = {University of Central Missouri}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ictalurus_furcatus}},'...
'note = {Accessed : 2017-04-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/ictalurus furcatus.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ictalurus-furcatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/995103/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

