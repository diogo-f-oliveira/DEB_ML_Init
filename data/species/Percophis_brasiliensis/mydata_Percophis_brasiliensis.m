  function [data, auxData, metaData, txtData, weights] = mydata_Percophis_brasiliensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percophidae';
metaData.species    = 'Percophis_brasiliensis'; 
metaData.species_en = 'Brazilian flathead'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 29];

%% set data
% zero-variate data
data.ab = 9.5;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(10.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 19*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'MesaCali2011';   
  temp.am = C2K(10.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 38.71;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'MesaCali2011'; 
data.Lpm = 29.24;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'MesaCali2011'; 
data.Li = 68.5;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.24e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 311;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'MesaCali2020','fishbase'};
  comment.Wwp = 'based on 0.00372*Lp^3.10, see F1';
data.Wwi = 1.82e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'MesaCali2020','fishbase'};
  comment.Wwi = 'based on 0.00372*Li^3.10, see F1';
 
% univariate data
% time-length
data.tL_fm = [ ... % time(yr), total length (cm)
0	22.826 25.435
1	30.000 30.435
2	38.261 38.043
3	45.000 41.957
4	51.957 46.957
5	54.130 49.130
6	57.609 49.783
7	59.130 51.304
8	61.087 54.565
9	61.304 56.304
10	64.130 55.000
11	64.130 55.217
12	63.043 58.913
13	67.174 54.783
14	63.696 NaN];
data.tL_fm(:,1) = 365 * (1.2+data.tL_fm(:,1));  % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time', 'total length'};  
temp.tL_fm = C2K(10.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MesaCali2011'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
33.100	56845.184
40.964	74537.315
42.034	25551.319
44.168	138069.069
44.838	82569.385
45.117	61348.121
46.269	111893.299
46.805	209777.899
46.847	149403.581
46.888	82502.480
46.935	41708.384
46.998	66181.868
47.909	64520.426
48.143	90620.040
48.771	98758.044
49.786	57932.355
49.905	75877.197
49.911	101984.245
50.102	183563.100
51.075	203111.771
51.680	116611.820
51.771	255303.482
51.901	88865.674
51.904	100287.492
52.039	188394.989
52.101	209605.060
52.992	124727.523
53.014	217733.771
53.095	314001.532
54.069	106743.610
54.819	144248.316
54.875	372684.714
54.880	162195.016
54.924	106715.733
54.992	388997.892
55.004	202983.536
55.866	233957.742
55.869	248642.930
55.871	256801.377
55.952	119735.804
55.955	134420.993
55.965	171949.859
55.968	185003.341
56.011	362857.433
56.844	276350.048
57.005	233920.572
57.019	292661.367
57.280	194750.749
57.857	227365.911
57.966	206150.265
58.835	264863.183
58.867	398661.647
58.900	299126.778
58.937	217540.489
59.003	253435.790
59.076	553666.486
59.104	201218.019
59.778	163666.893
59.786	197932.347
59.909	233825.789
59.963	222402.113
59.977	511212.850
60.878	472022.584
61.018	343113.621
61.025	140782.371
61.054	489965.589
61.810	321875.631
61.871	338190.667
61.914	284343.090
62.844	361002.709
62.980	215776.830
63.029	416474.558
63.042	236986.943
63.924	351177.286
63.938	408286.375
64.042	602455.461
64.931	276086.143
64.992	292401.180
65.001	331561.710
65.151	243444.920
65.978	365795.569
66.919	254809.125
66.966	215646.736
67.919	618645.968];
units.LN = {'d', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(10.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MiliMacc2011';

    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm =  5 * weights.tL_fm;
weights.Lp =  3 * weights.Lp;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'I had to add 1 yr to ages estimates to math tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00372*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7744Z'; % Cat of Life
metaData.links.id_ITIS = '630413'; % ITIS
metaData.links.id_EoL = '46573321'; % Ency of Life
metaData.links.id_Wiki = 'Percophis_brasiliensis'; % Wikipedia
metaData.links.id_ADW = 'Percophis_brasiliensis'; % ADW
metaData.links.id_Taxo = '183504'; % Taxonomicon
metaData.links.id_WoRMS = '282218'; % WoRMS
metaData.links.id_fishbase = 'Percophis-brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Percophis_brasiliensis}}';  
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
bibkey = 'MesaCali2011'; type = 'Article'; bib = [ ... 
'doi = {10.3856/vol39-issue2-fulltext-11}, ' ...
'author = {La Mesa, Mario and Calì, Federico and Riginella, Emilio and Mazzoldi, Carlotta and Jones, Christopher D.}, ' ...
'year = {2011}, ' ...
'title = {Age determination, validation, and growth of {B}razilian flathead (\emph{Percophis brasiliensis}) from the southwest {A}tlantic coastal waters (34deg-41deg S)}, ' ... 
'journal = {Lat. Am. J. Aquat. Res.}, ' ...
'volume = {39(2)}, ' ...
'pages = {297-305}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiliMacc2011'; type = 'Article'; bib = [ ... 
'author = {M.I. Militelli and G.J. Macchi}, ' ...
'year = {2011}, ' ...
'title = {Preliminary estimate of spawning frequency and batch fecundity of {B}razilian flathead, \emph{Percophis brasiliensis}, in coastal waters off {B}uenos {A}ires {P}rovince}, ' ... 
'journal = {Sci. Mar.}, ' ...
'volume = {65(2)}, ' ...
'pages = {169-172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Percophis-brasiliensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
