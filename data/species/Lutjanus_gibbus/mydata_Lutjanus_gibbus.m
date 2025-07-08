function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_gibbus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_gibbus'; 
metaData.species_en = 'Humpback red snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 21];

%% set data
% zero-variate data

data.ab = (27+45)/24;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'uwi';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'hatch after 27 h, yolksac absorption after 45 h';
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'uwi';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';
  
data.Lp  = 21.5; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 56.8;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'PrihKama2020';
  comment.Wwb = 'based egg diameter of 0.9 mm of L. stellatus: pi/6*0.09^3'; 
data.Wwp = 140;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'HeupCurr2009','fishbase'};  
  comment.Wwp = 'based on 0.01549*Lp^2.97, see F1';
data.Wwi = 2515; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^2.97, see F1; max reproted weight 2.8 kg';

data.GSI  = 0.015;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'PrihKama2020';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
1.997	26.190
2.010	30.340
2.011	27.263
2.012	22.898
2.025	26.762
2.026	23.828
2.927	30.268
2.970	29.481
2.970	28.766
2.970	28.122
2.971	26.547
3.014	25.188
3.028	27.406
3.974	27.120
3.987	31.270
3.988	27.764
3.988	26.691
4.001	32.129
4.001	30.626
4.029	33.846
4.031	29.052
4.961	32.630
4.976	30.626
4.988	34.991
5.004	32.057
5.005	28.122
5.019	29.553
5.034	27.120
5.934	34.562
5.963	34.132
5.964	32.057
5.964	31.127
5.965	29.553
5.978	33.131
6.007	31.699
6.008	28.408
6.021	33.703
6.923	35.850
6.938	32.200
6.939	30.984
6.950	38.211
6.952	33.345
6.953	31.270
6.965	37.281
6.968	28.837
7.038	32.487
7.052	34.204
7.927	33.560
7.940	37.209
7.940	34.848
7.953	39.356
7.954	38.211
7.983	35.778
7.983	35.134
7.984	34.275
8.013	32.200
8.025	37.567
8.026	36.136
8.041	32.773
8.957	35.778
8.971	37.138
8.987	33.703
8.988	31.556
9.000	36.494
9.029	34.776
9.974	39.213
9.974	37.710
9.989	36.136
10.003	38.283
10.003	36.708
10.018	35.635
10.019	33.560
10.978	36.494
10.991	39.857
11.937	37.853
11.952	36.708];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));  % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HeupCurr2009';

% lengt-weight
data.LW = [ ... % fork length (cm), weight (g)
22.772	186.125
25.519	287.648
25.946	317.259
26.252	351.100
26.679	406.091
26.862	283.418
27.350	351.100
27.534	376.480
27.656	321.489
27.900	439.932
28.632	461.083
29.060	342.640
30.037	511.844
30.098	482.233
30.281	621.827
30.281	558.376
30.586	600.677
31.746	566.836
32.479	668.359
33.211	744.501
33.516	710.660
33.761	782.572
34.005	841.793
34.371	807.953
34.493	947.546
34.554	909.475
34.676	778.342
34.921	964.467
35.226	1010.998
35.470	905.245
35.775	1053.299
35.775	934.856
35.836	816.413
35.897	871.404
36.203	1010.998
36.203	964.467
36.630	1019.458
37.241	1218.274
37.363	1049.069
37.729	1180.203
37.790	1273.266
37.851	1222.504
37.851	1159.052
38.950	1425.550
39.316	1218.274];
units.LW = {'cm', 'g'}; label.LW = {'fork length', 'weight'};  
bibkey.LW = 'HeupCurr2009';
  
%% set weights for all real dunits, label, weights);
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;

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
D1 = 'Data Wwp and Wwi ignonerd due to inconsistency with LW data';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01549*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WG9X'; % Cat of Life
metaData.links.id_ITIS = '168866'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_gibbus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_gibbus'; % ADW
metaData.links.id_Taxo = '106204'; % Taxonomicon
metaData.links.id_WoRMS = '218480'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-gibbus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_gibbus}}';
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
bibkey = 'HeupCurr2009'; type = 'techreport'; bib = [ ...
'author = {Michelle R. Heupel and Leanne M. Currey and Ashley J. Williams and Colin A. Simpfendorfer and Aaron C. Ballagh and Ann L. Penny}, ' ...
'year = {2009}, ' ...
'title = {The Comparative Biology of Lutjanid Species on the Great Barrier Reef}, ' ... 
'institution = {Dept Environ., Water, Heritage and Arts, James Cook University}, ' ...
'howpublished = {\url{https://www.rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Heupel-M-2008-Comparative-Biology-of-Lutjanid-Species-on-GBR.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrihKama2020'; type = 'Article'; bib = [ ... 
'author = {Prihatiningsih and Mohammad M. Kamal and Rahmat Kurnia and Ali Suman }, ' ... 
'year = {2020}, ' ...
'title = {The spawning season, growth, and mortality of humpback red snapper (\emph{Lutjanus gibbus} ({F}orsskal, 1775) in the Southern {B}anten waters, {I}ndonesia}, ' ...
'journal = {AACL Bioflux}, ' ...
'volume = {13(2)}, ' ...
'pages = {1079-1089}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-gibbus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
