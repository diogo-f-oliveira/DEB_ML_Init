function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_labriformis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_labriformis'; 
metaData.species_en = 'Starry grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 29];

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 30 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'CraiPond1999';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 60;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 490;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01585*Lp^3.04, see F1';
data.Wwi = 4e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01585*Li^3.04, see F1';

data.Ri  = 7.5e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Epinephelus_coioides: 463940*4e3/24.6e3'; 
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.999	20.358
1.917	20.361
1.919	18.807
1.920	18.100
1.976	16.969
1.976	16.545
2.833	22.061
2.836	20.082
2.891	19.376
2.935	26.867
3.000	18.387
3.051	20.931
3.055	17.680
3.802	24.609
3.804	23.196
3.861	20.793
3.917	19.239
4.078	20.370
4.184	21.643
4.937	23.907
4.987	27.300
4.987	26.734
4.989	25.603
4.992	23.059
4.993	22.353
4.995	21.080
4.997	19.808
4.998	19.243
5.028	36.628
5.854	24.900
5.906	26.172
5.912	22.356
5.912	21.932
5.913	21.226
6.009	30.130
6.879	25.894
6.880	25.328
6.881	24.339
6.939	21.512
6.984	28.156
6.985	27.166
6.992	22.361
6.995	20.240
7.852	25.191
7.898	31.269
7.904	26.746
7.905	25.898
7.910	22.647
7.911	21.658
7.962	23.919
7.967	19.820
7.968	19.114
8.011	27.594
8.875	28.022
8.933	24.771
8.936	22.510
8.980	29.860
8.989	23.641
9.039	26.609
9.093	26.044
9.893	34.104
9.952	30.146
9.957	26.472
9.960	24.069
10.008	28.875
10.062	28.309
10.879	23.366
10.930	25.486
10.982	27.324
10.986	24.638
10.987	23.790
10.992	19.974
11.900	27.327
11.906	22.804
12.060	28.741
12.827	20.829
12.922	30.582
12.979	28.180
12.981	27.049
12.988	21.678
13.907	20.834
13.948	31.152
14.916	33.700
14.923	28.612
14.928	25.078
14.970	34.266
14.987	21.403
16.809	32.294
16.816	26.782
16.864	31.022
16.914	33.991
16.921	29.185
17.783	30.602
17.790	25.231
17.843	26.503
17.900	24.242
18.868	27.497
18.965	34.988
21.948	26.379
22.869	24.121
22.970	29.492
23.885	31.757
25.887	29.363
25.890	26.536
27.997	26.262
29.889	25.280];
data.tL(:,1) = (0.8+data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CraiPond1999'; comment.tL = 'Data from Puerto Vallarta and Galapagos';
  
% length-weight
data.LW = [ ... % std length(cm), weight (g)
16.590	89.897
17.445	132.431
18.096	136.836
18.544	165.956
18.910	174.887
18.995	246.696
19.194	163.628
19.237	197.289
19.398	168.091
19.561	174.803
19.562	199.491
19.806	194.971
19.845	172.522
20.089	176.980
20.131	203.907
20.175	273.478
20.211	165.742
20.537	185.900
20.578	199.361
20.701	226.278
20.944	203.803
21.148	214.999
21.393	232.922
21.475	253.111
21.514	208.219
21.800	246.336
21.839	221.643
21.893	504.429
21.922	259.787
22.044	259.771
22.169	313.621
22.208	279.950
22.210	329.326
22.492	279.913
22.495	333.778
22.610	181.145
22.654	255.204
22.655	273.160
22.696	286.621
22.697	306.820
22.856	239.468
23.061	275.352
23.099	214.748
23.226	326.952
23.346	273.071
23.346	284.293
23.509	295.494
23.552	329.154
23.593	349.348
23.876	304.424
23.917	317.885
24.123	376.213
24.164	389.674
24.243	340.287
24.447	360.461
24.487	346.989
24.852	324.499
24.898	447.934
24.936	389.575
24.975	333.460
25.223	434.426
25.261	376.067
25.340	328.925
25.425	407.467
25.828	335.595
25.831	400.682
26.075	387.185
26.199	436.545
26.199	441.034
26.279	425.313
26.321	452.240
26.439	366.938
26.484	461.197
26.609	519.535
26.648	479.131
26.767	425.251
26.970	402.781
26.972	452.157
27.016	535.194
27.176	470.086
27.340	494.753
27.340	514.952
27.418	443.122
27.426	613.695
27.991	517.114
28.031	499.153
28.194	508.110
28.933	667.367
29.046	481.068
29.133	606.743
29.825	629.098
29.865	611.138
30.812	864.632
31.095	839.907];
units.LW   = {'cm', 'g'};  label.LW = {'std length','weight'};  
bibkey.LW = 'CraiPond1999';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'dat Wwp and Wwi ignored due to inconsistency with LW data';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01585*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6FTP2'; % Cat of Life
metaData.links.id_ITIS = '167701'; % ITIS
metaData.links.id_EoL = '46579681'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_labriformis'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_labriformis'; % ADW
metaData.links.id_Taxo = '173908'; % Taxonomicon
metaData.links.id_WoRMS = '273858'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-labriformis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_labriformis}}';
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
bibkey = 'CraiPond1999'; type = 'Article'; bib = [ ... 
'author = {Matthew T. Craig and Daniel J. Pondella and John C. Hafner}, ' ... 
'year = {1999}, ' ...
'title = {ANALYSIS OF AGE AND GROWTH IN TWO EASTERN {P}ACIFIC GROUPERS ({S}ERRANIDAE: {E}PINEPHELINAE)}, ' ...
'journal = {BULLETIN OF MARINE SCIENCE}, ' ...
'volume = {65(3)}, ' ...
'pages = {807–814}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Eria2008'; type = 'phdthesis'; bib = [ ... 
'author = {Erisman, Brad Edward}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive biology and evolution of epinephelid and serranid fishes ({P}erciformes, {E}pinephelidae, {S}erranidae)}, ' ...
'school = {UC San Diego}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-labriformis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

