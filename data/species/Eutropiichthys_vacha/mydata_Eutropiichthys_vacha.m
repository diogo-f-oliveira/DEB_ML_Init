  function [data, auxData, metaData, txtData, weights] = mydata_Eutropiichthys_vacha
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Schilbeidae';
metaData.species    = 'Eutropiichthys_vacha'; 
metaData.species_en = 'Batchwa vacha'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 27];

%% set data
% zero-variate data
data.ab = 2.5; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';   bibkey.Lp = 'fishbase';
data.Li = 38.2;     units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 6.5e-5;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 16.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwi = 'based on 0.00661*Lp^2.96, see F1';
data.Wwi = 318.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00661*Li^2.96, see F1; max published weight 1.4 kg, but that is unlikely, given Li';

data.GSI = 0.11; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'KhatHoss2019';
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (cm)
152.248	4.573
183.905	8.187
240.872	15.422
334.331	22.985
455.628	27.604];
data.tL(:,1) = data.tL(:,1)-100; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RayKuma2022';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
13.480	4464.165
13.766	5279.607
14.128	4474.665
16.573	4784.585
17.574	7503.524
18.216	10216.638
19.008	9959.207
20.009	12678.146
21.448	12701.478
25.667	24391.526
25.733	27365.563
25.747	20879.302
28.167	32810.441
28.736	35792.645
32.682	40721.501
33.615	42087.970
36.277	42131.134
39.142	47583.012
39.640	50293.789
43.583	56844.209
44.859	65513.556
45.349	71737.723
46.715	72300.408
49.074	79095.427];
units.WN = {'g', '#'};  label.WN = {'weight','fecundity'};  
temp.WN = C2K(25);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'KhatHoss2019';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 3;

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
F1 = 'length-weight: Ww in g = 0.00661*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6HKBS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '218010'; % Ency of Life
metaData.links.id_Wiki = 'Eutropiichthys_vacha'; % Wikipedia
metaData.links.id_ADW = 'Eutropiichthys_vacha'; % ADW
metaData.links.id_Taxo = '174369'; % Taxonomicon
metaData.links.id_WoRMS = '280759'; % WoRMS
metaData.links.id_fishbase = 'Eutropiichthys-vacha'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Eutropiichthys_vacha}}';  
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
bibkey = 'RayKuma2022'; type = 'Article'; bib = [ ...
'doi = {10.21077/ijf.2022.69.2.115676-04}, ' ...
'author = {Archisma Ray and Lohith Kumar and Himanshu Sekhar Swain and B. K. Das}, ' ...
'year = {2022}, ' ...
'title = {Growth, mortality and stock status of three commercially important catfishes from the {R}iver {G}anga, {I}ndia}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {69(2)}, '...
'pages = {30-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KhatHoss2019'; type = 'Article'; bib = [ ...
'doi = {10.1007/s11356-019-04523-5}, ' ...
'author = {Dalia Khatun and Md. Yeamin Hossain and Fairuz Nawer and Ashraf A. Mostafa and Abdulaziz A. Al-Askar}, ' ...
'year = {2019}, ' ...
'title = {Reproduction of \emph{Eutropiichthys vacha} ({S}chilbeidae) in the {G}anges {R}iver ({NW} {B}angladesh) with special reference to potential influence of climate variability}, ' ... 
'journal = {Environmental Science and Pollution Research}, ' ...
'volume = {26}, '...
'pages = {10800–10815}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Clupisoma-garua.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

