  function [data, auxData, metaData, txtData, weights] = mydata_Plagioscion_squamosissimus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Plagioscion_squamosissimus'; 
metaData.species_en = 'South American silver croaker '; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 29];

%% set data
% zero-variate data
data.ab = 4.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'BrusPere1997';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';bibkey.Lp = 'CarnBene2002';
data.Lpm = 16.2;     units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';bibkey.Lpm = 'CarnBene2002';
data.Li = 70;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'actually 80 cm, but the is inconsistent with Wwi combined with F1';

data.Wwb = 5.23e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 63.65;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'CarnBene2002','fishbase'};
  comment.Wwp = 'based on 0.00871*Lp^3.09, see F1';
data.Wwi = 4.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.09, see F1';

data.Ri = 5e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	0.603
0.833	14.118
1.635	25.158
2.477	34.640
3.370	41.945
4.182	48.951
5.013	55.644
5.966	58.598];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
  temp.tL_f = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BrusPere1997';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.001	0.196
0.966	12.729
1.959	22.158
2.997	29.516
3.991	36.257
5.012	40.721];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
  temp.tL_m = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BrusPere1997';
comment.tL_m = 'Data for males';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
8.972	84.903
10.568	73.360
11.966	19.145
12.963	34.870
14.159	50.918
15.255	66.804
16.552	54.779
18.047	71.309
18.943	100.990
20.140	102.921
21.635	119.451
23.228	192.609
24.126	194.057
25.421	224.383
26.219	225.670
27.614	256.156
28.708	328.510
30.004	330.601
30.697	487.013
32.892	448.202
33.484	632.686
35.375	734.561
37.270	723.501
38.263	852.162
39.948	1165.468
43.240	1128.427
47.510	1657.669
47.899	1940.650
51.182	2185.947
54.460	2572.411
55.072	2135.753
68.822	5461.467];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length', 'weight','females'};  
bibkey.LW_f = 'BrusPere1997';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % total length (cm)m weight (g)
9.870	31.201
10.372	49.670
10.743	20.596
11.307	39.090
11.931	39.343
12.866	32.417
13.617	47.334
14.303	47.612
14.990	51.544
15.927	51.924
16.865	70.570
17.621	129.324
17.679	96.471
17.800	56.337
18.051	74.704
18.803	96.927
19.614	97.257
20.174	79.219
20.366	119.480
20.490	112.224
20.805	134.269
20.994	148.958
21.491	130.895
22.366	142.209
23.241	149.870
23.620	193.860
23.624	223.085
23.869	183.002
24.619	194.265
24.621	212.531
24.625	245.409
24.680	179.678
25.122	223.693
25.933	224.022
26.873	260.934
27.626	290.463
28.251	301.676
28.639	415.075
29.313	305.759
29.317	342.291
29.573	393.536
30.636	415.886
32.702	467.866
34.023	556.073
35.593	640.729
40.752	989.854
43.527	1232.076
46.304	1499.871];    
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length', 'weight','males'};  
bibkey.LW_m = 'BrusPere1997';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JH66'; % Cat of Life
metaData.links.id_ITIS = '646728'; % ITIS
metaData.links.id_EoL = '207798'; % Ency of Life
metaData.links.id_Wiki = 'Plagioscion'; % Wikipedia
metaData.links.id_ADW = 'Plagioscion_squamosissimus'; % ADW
metaData.links.id_Taxo = '183949'; % Taxonomicon
metaData.links.id_WoRMS = '990098'; % WoRMS
metaData.links.id_fishbase = 'Plagioscion-squamosissimus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Plagioscion}}';  
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
bibkey = 'Cast1998'; type = 'Article'; bib = [ ...
'author = {Castro, A. C. L.}, ' ...
'year = {1998}, ' ...
'title = {Idade e crescimento de \emph{Plagioscion squamosissimus} ({H}eckel, 1840) ({A}canthopterygii, {S}cianidae) do reservat\''{o}rio de {B}arra {B}onita, S\~{a}o Paulo, atrav\''{e}s da estrutura dos ot\''{o}litos}, ' ... 
'journal = {Acta Scientiarum. Biological Sciences}, ' ...
'volume = {20(2)}, '...
'pages = {179-184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CarnBene2002'; type = 'Article'; bib = [ ...
'author = {Regina Cintria Carnel\''{o}s and Evanilde Benedito-Cecilio}, ' ...
'year = {2002}, ' ...
'title = {Reproductive strategies of \emph{Plagioscion squamosissimus} {H}echel, 1840 (Osteichthyes, Sciaenidae) in the {I}taipu {R}eservoir, {B}razil}, ' ... 
'journal = {Brazilian Archives of Biology and Technology}, ' ...
'volume = {45(3)}, '...
'pages = {317-324}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Plagioscion-squamosissimus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

