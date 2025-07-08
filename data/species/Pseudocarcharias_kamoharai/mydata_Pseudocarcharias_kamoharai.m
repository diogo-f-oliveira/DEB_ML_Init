function [data, auxData, metaData, txtData, weights] = mydata_Pseudocarcharias_kamoharai

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Pseudocarchariidae';
metaData.species    = 'Pseudocarcharias_kamoharai'; 
metaData.species_en = 'Crocodile shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.9); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 08];


%% set data
% zero-variate data

data.am = 13*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'LessAndr2016';   
  temp.am = C2K(24.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 41;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'LessAndr2016'; 
  comment.Lb = '40 till 43 cm';
data.Lp  = 91.6;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'LessAndr2016'; 
data.Lpm  = 80;    units.Lpm  = 'cm';  label.Lpm = 'total length at puberty for males';  bibkey.Lpm  = 'LessAndr2016'; 
data.Li  = 122;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';
data.Lim  = 110;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 418;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on 0.00389*Lb^3.12,  see F2';
data.Wwp = 5.14e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'Wiki';
  comment.Wwp = 'based on 0.00389*Lp^3.12,  see F2';
data.Wwpm = 3.37e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';     bibkey.Wwpm = 'Wiki';
  comment.Wwpm = 'based on 0.00389*Lpm^3.12,  see F2';
data.Wwi = 12.6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12,  see F2';
data.Wwim = 9.1e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00389*Lim^3.12,  see F2';
 
data.Ri  = 4/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(24.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter, assumed: 1 litter each 2 yrs';

 % uni-variate data
 
% t-L data 
data.tL = [ ... % time since birth (yr), total length (cm)
1.213	65.832
2.112	76.496
2.303	73.597
3.010	75.548
3.011	79.419
3.030	83.290
3.260	82.005
3.297	78.457
3.318	89.103
3.412	81.040
3.431	81.363
3.470	85.558
3.565	80.076
3.622	78.142
3.871	82.663
3.947	79.116
4.024	85.570
4.025	87.828
4.025	91.053
4.083	94.281
4.158	82.669
4.178	91.702
4.216	89.445
4.255	92.671
4.311	88.156
4.330	86.544
4.351	95.577
4.406	82.029
4.427	91.707
4.427	95.256
4.483	83.967
4.484	89.450
4.540	86.226
4.560	87.517
4.637	90.099
4.656	92.357
4.788	83.328
4.789	86.554
4.922	81.395
4.941	82.041
4.981	93.010
5.019	89.139
5.037	83.978
5.056	86.237
5.057	87.850
5.058	95.914
5.115	98.174
5.173	99.788
5.287	93.016
5.287	95.597
5.324	83.662
5.325	97.856
5.458	86.891
5.458	88.826
5.497	91.085
5.554	94.312
5.554	94.957
5.574	99.474
5.707	91.735
5.744	87.865
5.784	94.317
5.917	93.675
5.937	100.772
6.031	88.193
6.051	95.613
6.053	104.968
6.070	93.356
6.090	99.162
6.222	88.843
6.262	101.424
6.280	93.037
6.300	97.877
6.472	94.654
6.548	97.882
6.586	91.754
6.587	104.334
6.624	94.980
6.625	102.077
6.758	95.306
6.796	92.726
6.854	99.501
6.949	89.503
6.949	95.310
6.969	98.536
6.988	100.795
7.008	105.956
7.044	87.893
7.122	100.475
7.161	106.282
7.236	94.671
7.236	96.929
7.237	104.026
7.313	101.124
7.524	102.419
7.543	107.581
7.600	105.969
7.696	103.390
7.752	96.295
7.791	101.780
7.848	99.523
7.924	98.879
8.039	97.269
8.097	101.464
8.270	110.177
8.306	94.371
8.384	104.373
8.537	107.280
8.651	104.701
8.785	107.930
8.824	108.253
8.918	102.772
9.129	107.937
9.149	114.712
9.302	109.554
9.302	111.167
9.454	109.880
9.856	108.276
10.143	114.733
10.602	116.356
11.175	112.498
13.794	121.909];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'LessAndr2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 8 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviparity (aplacental viviparity), with embryos feeding on other ova produced by the mother (oophagy) after the yolk sac is absorbed';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4NQQW'; % Cat of Life
metaData.links.id_ITIS = '159897'; % ITIS
metaData.links.id_EoL = '46559771'; % Ency of Life
metaData.links.id_Wiki = 'Pseudocarcharias_kamoharai'; % Wikipedia
metaData.links.id_ADW = 'Pseudocarcharias_kamoharai'; % ADW
metaData.links.id_Taxo = '41887'; % Taxonomicon
metaData.links.id_WoRMS = '217632'; % WoRMS
metaData.links.id_fishbase = 'Pseudocarcharias-kamoharai'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudocarcharias_kamoharai}}';
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
bibkey = 'LessAndr2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12717}, ' ...
'author = {R. Lessa and H. A. Andrade and K. L. De Lima and F. M. Santana}, ' ... 
'year = {2016}, ' ...
'title = {Age and growth of the midwater crocodile shark \emph{Pseudocarcharias kamoharai}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {89}, ' ...
'pages = {371-385}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pseudocarcharias-kamoharai}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

