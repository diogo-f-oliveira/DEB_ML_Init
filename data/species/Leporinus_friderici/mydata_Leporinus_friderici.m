  function [data, auxData, metaData, txtData, weights] = mydata_Leporinus_friderici
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Anostomidae';
metaData.species    = 'Leporinus_friderici'; 
metaData.species_en = 'Threespot leporinus'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2019 02 10];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 02 10]; 


%% set data
% zero-variate data
data.am = 15*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18.1;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 40;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 85.3;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01175*Lp^3.07, see F1';
data.Wwi = 974;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.07, see F1';
  
data.Ri = 117189 	/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(24.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% t-L data
data.tL = [ ... % number of rainy months (#), total length (cm)
2.950	13.954
3.919	13.585
3.968	12.847
3.973	14.482
3.975	14.903
3.977	15.536
4.017	12.214
4.998	15.431
5.000	16.116
5.002	16.591
5.003	17.065
5.005	17.645
5.008	18.278
5.929	18.963
6.001	17.592
6.931	20.545
6.933	21.230
7.981	21.547
8.938	17.645
8.967	18.805
8.988	17.223
8.995	19.279
8.997	19.965
8.999	20.439
9.000	20.861
9.001	21.230
9.932	24.657
9.935	25.554
9.937	26.186
9.940	26.977
9.944	28.243
9.993	20.123
10.000	22.127
10.016	19.332
10.022	21.072
10.024	21.652
10.027	22.496
10.029	23.128
10.945	22.021
10.953	24.341
11.924	24.605
11.964	21.283
11.984	27.346
12.013	28.137
12.995	24.236
12.997	24.868
13.000	25.659
13.005	27.083
13.006	27.504
13.060	28.401
13.922	26.397
13.950	27.293
13.952	27.821
13.954	28.401
13.957	29.244
13.985	29.877
13.996	25.764
14.019	25.026
14.960	31.406
14.989	32.408
15.015	25.079
15.934	32.355
15.970	28.032
15.982	31.353
15.988	33.251
16.005	30.721
16.013	25.606
16.027	29.561
16.960	33.726
16.967	28.190
17.005	32.039
17.921	31.037
18.957	35.149
18.959	35.835
18.965	29.982
18.979	34.148
18.992	30.510
18.994	31.142
18.997	31.828
18.999	32.460
19.002	33.304
19.968	32.144
19.970	32.882
19.979	35.360
20.993	33.251
20.995	33.779
20.998	34.728
21.918	34.728
22.948	37.364
23.885	35.149
24.934	35.729
24.936	36.309];
data.tL(:,1) = data.tL(:,1) * 2 * 30.5; % convert rumber of rainy months to time since birth in d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BoujLeco1991';
comment.tL = 'number of rainy months was converted to time since birth by multiplication with 2';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 2 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.07';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TG6K'; % Cat of Life
metaData.links.id_ITIS = '641263'; % ITIS
metaData.links.id_EoL = '205923'; % Ency of Life
metaData.links.id_Wiki = 'Leporinus'; % Wikipedia
metaData.links.id_ADW = 'Leporinus_friderici'; % ADW
metaData.links.id_Taxo = '437085'; % Taxonomicon
metaData.links.id_WoRMS = '1022984'; % WoRMS
metaData.links.id_fishbase = 'Leporinus-friderici'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Leporinus}}';  
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
bibkey = 'BoujLeco1991'; type = 'Article'; bib = [ ...  
'author = {T. Boujard and F. Lecomte and J.-F. Renno and F. Meunier and P. Neveu}, ' ...
'year  = {1991}, ' ...
'title = {Growth in four populations of \emph{Leporinus friderici} ({B}loch, 1794) ({A}nostomidae, {T}eleostei) in {F}rench {G}uiana}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {38}, ' ...
'pages = {387-397}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GosmPire2015'; type = 'Article'; bib = [ ...  
'author = {M\''{a}rio Augusto Gosmann and Alex Pires de Oliveira Nuner}, ' ...
'year  = {2015}, ' ...
'title = {EGG INCUBATION AND LARVAL REARING OF PIAVA, \emph{Leporinus obtusidens}: EFFECT OF pH}, ' ...  
'journal = {Bol. Inst. Pesca , Sao Paulo}, ' ...
'volume = {41}, ' ...
'pages = {319-326}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Leporinus-friderici.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

