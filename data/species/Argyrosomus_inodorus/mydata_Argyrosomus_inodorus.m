function [data, auxData, metaData, txtData, weights] = mydata_Argyrosomus_inodorus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Argyrosomus_inodorus'; 
metaData.species_en = 'Mild meagre'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 16];

%% set data
% zero-variate data

data.ab = 15;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(16.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(16.3);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 34.4;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 145;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based of egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 424; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00813*Lp^3.07, see F1';
data.Wwi = 35.1e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.07, see F1; max piblished weight 36.3 kg';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(16.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Argyrosomus regius';
 
% uni-variate data
% time-length
data.tL =	[ ... % time since birth (yr), total length (cm)
0.912	28.385
0.944	33.303
0.988	31.119
0.991	29.480
0.996	26.474
0.998	25.381
0.999	25.381
1.030	30.300
1.081	23.744
1.114	28.663
1.158	26.205
1.196	28.119
1.972	49.177
2.107	41.257
2.937	54.394
2.948	47.564
3.011	58.494
3.075	44.015
3.096	55.764
3.120	41.011
3.144	51.667
3.147	49.481
3.236	44.566
3.906	56.605
3.913	51.961
3.983	59.066
3.996	51.143
4.002	47.318
4.032	53.603
4.038	49.778
4.070	55.243
4.162	48.415
4.209	44.591
4.318	52.518
4.918	57.451
4.924	53.626
5.007	52.536
5.029	63.738
5.059	70.297
5.078	58.822
5.082	56.363
5.096	47.620
5.115	61.008
5.161	57.185
5.206	54.453
5.956	66.768
5.960	64.583
5.984	74.692
5.988	47.370
6.012	57.207
6.024	50.103
6.087	61.034
6.095	56.116
6.100	53.384
6.102	52.018
6.142	77.156
6.962	71.713
7.026	56.960
7.031	79.091
7.069	55.322
7.074	52.590
7.081	48.219
7.088	68.710
7.094	65.159
7.102	60.241
7.112	53.684
7.186	58.057
7.966	76.930
8.009	75.565
8.015	72.287
8.039	82.123
8.057	71.195
8.074	85.403
8.087	77.753
8.124	79.940
8.939	77.229
8.988	71.766
8.995	92.531
9.014	81.056
9.026	73.406
9.033	69.035
9.057	79.418
9.063	75.593
9.950	78.622
9.962	70.972
10.048	67.968
10.078	74.253
10.080	98.024
10.082	72.068
10.141	85.730
10.156	76.441
10.929	74.822
10.946	89.030
10.949	87.391
10.965	77.555
10.968	100.506
11.013	98.048
11.021	93.131
11.040	81.382
11.113	86.029
11.118	83.297
11.175	73.189
11.204	80.021
11.938	102.171
11.941	100.532
12.037	90.971
12.055	80.043
12.066	73.213
12.974	88.264
13.021	84.167
13.026	81.435
13.051	90.725
14.016	95.395
14.035	83.647
15.032	94.055
15.651	37.241
15.787	127.955
16.009	91.349
16.900	91.919
16.964	127.439
17.066	89.191
17.991	93.860
18.955	124.486
20.018	93.367
28.056	85.927
28.109	128.278
28.122	95.218];
data.tL(:,1) = (0.3+data.tL(:,1))*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(16.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KircVoge1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weights = weights;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f22','tL_f21'}; subtitle1 = {'mesocosm'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Namibia southwards around the Cape of Good Hope and northwards at least as far as the Kei River in South Africa';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'GKJ4'; % Cat of Life
metaData.links.id_ITIS = '646566'; % ITIS
metaData.links.id_EoL = '46578921'; % Ency of Life
metaData.links.id_Wiki = 'Argyrosomus_inodorus'; % Wikipedia
metaData.links.id_ADW = 'Argyrosomus_inodorus'; % ADW
metaData.links.id_Taxo = '161637'; % Taxonomicon
metaData.links.id_WoRMS = '218630'; % WoRMS
metaData.links.id_fishbase = 'Argyrosomus-inodorus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argyrosomus_inodorus}}';
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
bibkey = 'KircVoge1999'; type = 'Article'; bib = [ ... 
'doi = {10.2989/025776199784125999}, ' ...
'author = {C. H. Kirchner and S. F. Voges}, ' ... 
'year = {1999}, ' ...
'title = {Growth of {N}amibian silver kob \emph{Agyrosomus inodorus} based on otoliths and mark-recapture data}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'volume = {21(1)}, ' ...
'pages = {201-209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Argyrosomus-inodorus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
