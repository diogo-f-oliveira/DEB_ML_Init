function [data, auxData, metaData, txtData, weights] = mydata_Glyptocephalus_zachirus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Glyptocephalus_zachirus'; 
metaData.species_en = 'Rex sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN', 'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.7); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 09];

%% set data
% zero-variate data
data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(3.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 27*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(3.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;  units.Lp = 'cm';   label.Lp = 'total length at puberty';       bibkey.Lp = 'HosiHort1977';
data.Li = 60;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 6.6e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 12;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','HosiHort1977'};  
  comment.Wwp = 'based on 0.00490*Lp^3.13, see F1';
data.Wwi = 1800; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00490*Li^3.13, see F1';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
 1	     9.717 11.953
 2.1	12.691 16.287
 3.2	16.646 22.280
 4.2    20.604 25.288
 5.2	25.685 28.464
 6.3    26.269 31.972
 7.3	27.279 33.326
 8.3	28.706 33.854
 9.3	31.259 36.534
10.3	31.844 37.887
11.3	34.676 38.578
12.4	33.718 35.299
13.4	34.583 NaN
14.4	34.327 NaN
15.5	38.004 NaN
16.5	48.000 NaN
18.5	48.327 NaN];
data.tL_fm(:,1) = 365 * (0.6+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(3.7);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'HosiHort1977'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % age (years) ~ weight (g)
10.786	0.652
11.841	1.804
12.972	2.263
13.878	5.263
14.934	3.671
16.066	11.240
17.122	9.648
17.953	17.236
19.008	15.644
19.990	21.695
21.048	32.325
22.106	44.482
23.088	52.061
23.692	55.080
24.975	61.113
24.976	64.168
25.958	73.275
26.186	80.900
27.093	88.483
27.094	94.594
27.926	106.766
28.001	102.178
28.984	118.923
29.137	129.608
29.969	140.252
30.272	146.345
30.950	143.248
31.254	155.451
32.011	167.627
32.316	182.886
32.768	181.331
33.224	199.636
33.981	214.868
34.282	208.738
35.118	242.298
35.418	234.641
36.175	248.345
36.184	288.067
37.163	281.896
38.070	292.535
39.063	355.113
40.050	385.608
41.049	477.214
42.560	489.344
44.144	493.830
45.250	735.151
46.283	625.088
47.149	800.730
48.137	838.864
51.353	1077.001];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'HosiHort1977'; 

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
12.160	3388.160
14.971	11320.075
19.494	9645.743
19.891	25955.485
22.104	20589.668
22.608	15172.304
25.116	27320.443
25.415	36987.396
26.622	34609.322
27.527	32222.168
28.530	38288.654
45.087	114241.119
59.219	229959.395];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(3.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'HosiHort1977'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Wwb = 5 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = .1; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00490*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GHMT'; % Cat of Life
metaData.links.id_ITIS = '172978'; % ITIS
metaData.links.id_EoL = '46570093'; % Ency of Life
metaData.links.id_Wiki = 'Glyptocephalus_zachirus'; % Wikipedia
metaData.links.id_ADW = 'Glyptocephalus_zachirus'; % ADW
metaData.links.id_Taxo = '175065'; % Taxonomicon
metaData.links.id_WoRMS = '274287'; % WoRMS
metaData.links.id_fishbase = 'Glyptocephalus-zachirus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glyptocephalus_zachirus}}';
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
bibkey = 'HosiHort1977'; type = 'article'; bib = [ ...
'author = {Hosie, M.J. and H.F. Horton}, ' ...
'year   = {1977}, ' ...
'title  = {Biology of the rex sole, \emph{Glyptocephalus zachirus}, in waters off {O}regon}, ' ... 
'journal = {Fish. Bull.}, ' ...
'page = {51-60}, ' ...
'volume = {75(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Glyptocephalus-zachirus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
