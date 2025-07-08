  function [data, auxData, metaData, txtData, weights] = mydata_Creteuchiloglanis_macropterus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Sisoridae';
metaData.species    = 'Creteuchiloglanis_macropterus'; 
metaData.species_en = 'Catfish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 
metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 11];

%% set data
% zero-variate data
data.ab = 20; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';   bibkey.Lp = 'guess';
data.Li = 43;     units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 117.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwi = 'based on 0.01122*Lp^3.04, see F1';
data.Wwi = 1e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 2.2 kg based on 0.01122*Li^3.04, see F1, gives 1.03 kg';

data.GSI = 0.045; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(18); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), length (cm)
    1  7.231  7.404
    2  9.196  9.389
    3 10.394 10.680
    4 11.443 11.779
    5 12.480 12.766
    6 13.410 13.916
    7 14.419 14.951
    8 15.399 NaN
    9 17.128 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.9) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth','total length'}; 
treat.tL_fm = {1, {'females','males'}};
temp.tL_fm = C2K(18);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'HuanHuan2018';

% length-weight
data.LW= [ ... % total length (cm), weight (g)
5.980	2.429
6.177	2.714
6.454	3.571
6.532	2.143
6.572	4.429
6.690	4.143
6.887	3.571
6.986	4.286
7.124	4.143
7.203	4.571
7.400	5.143
7.538	4.857
7.913	6.000
8.228	6.143
8.307	7.286
8.465	7.571
8.603	6.857
8.642	8.000
8.958	9.857
8.977	8.429
9.056	7.286
9.194	10.286
9.214	5.429
9.352	10.571
9.352	7.000
9.431	7.857
9.451	11.000
9.451	5.000
9.470	10.429
9.490	9.286
9.569	6.000
9.628	10.857
9.825	9.143
9.825	11.000
9.963	7.429
9.983	12.571
9.983	13.429
10.161	13.000
10.161	14.143
10.180	9.714
10.180	7.286
10.318	8.429
10.358	11.857
10.417	14.286
10.437	15.857
10.535	13.143
10.535	6.571
10.594	14.429
10.594	10.286
10.634	16.286
10.673	7.714
10.693	8.857
10.713	17.429
10.792	13.286
10.811	16.714
11.008	8.571
11.028	16.286
11.028	15.857
11.048	9.714
11.166	11.714
11.186	7.857
11.324	17.143
11.482	9.857
11.521	7.857
11.600	11.143
11.738	19.714
11.876	9.143
11.896	11.429
12.014	19.714
12.132	10.857
12.349	10.571
12.349	11.714
12.428	14.143
12.586	12.143
12.606	10.571
12.645	26.857
12.685	14.571
12.803	27.286
12.961	17.714
13.020	26.286
13.276	13.714
13.335	16.429
13.375	15.143
13.434	15.714
13.473	18.000
13.493	31.286
13.592	16.286
13.631	30.429
13.690	18.000
13.828	15.714
14.025	15.571
14.045	35.143
14.085	18.000
14.104	24.429
14.262	34.571
14.262	21.429
14.814	46.857
14.834	34.714
15.051	24.000
15.149	20.143
15.248	28.286
15.346	36.286
15.346	24.714
15.583	26.714
15.682	26.857
15.938	27.429
16.451	48.286
17.792	66.286
17.930	40.857
18.068	50.286
18.166	58.143];
units.LW = {'d', 'cm'};  label.LW = {'total length','weight'}; 
bibkey.LW = 'HuanHuan2018';
   
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 3;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 3;
weights.GSI = weights.GSI * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 3;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BGXS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '216997'; % Ency of Life
metaData.links.id_Wiki = 'Creteuchiloglanis_macropterus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3414671'; % Taxonomicon
metaData.links.id_WoRMS = '1009542'; % WoRMS
metaData.links.id_fishbase = 'Creteuchiloglanis-macropterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Creteuchiloglanis_macropterus}}';  
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
bibkey = 'HuanHuan2018'; type = 'Article'; bib = [ ...
'doi = {10.7541/2018.018}, ' ...
'author = {Jing Huang and Zi-Hao Huang and Qi-Wei Wei and Zhi-Jian Wang}, ' ...
'year = {2018}, ' ...
'title = {AGE AND GROWTH OF \emph{Creteuchiloglanis macropterus}}, ' ... 
'journal = {Acta Hydrobiological Sinica}, ' ...
'volume = {42(1)}, '...
'pages = {138-147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Creteuchiloglanis-macropterus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

