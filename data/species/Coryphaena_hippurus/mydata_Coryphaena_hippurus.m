function [data, auxData, metaData, txtData, weights] = mydata_Coryphaena_hippurus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Coryphaenidae';
metaData.species    = 'Coryphaena_hippurus'; 
metaData.species_en = 'Mahi-mahi'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'L_t'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 10 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.ab = 40.75/24;   units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'FAO';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4.5*30.5;   units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = 'ADW';
  temp.ap = C2K(28);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 5*365;      units.am = 'd';    label.am = 'life span';            bibkey.am = 'Wiki';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.13;      units.L0  = 'cm';  label.L0  = 'egg diameter';        bibkey.L0  = 'bluereef';  
data.Lb  = 0.5;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'bluereef';  
data.L15  = 1.5;      units.L15  = 'cm'; label.L15  = 'total length at 15 d'; bibkey.L15  = 'FAO'; 
  temp.L15 = C2K(28); units.temp.L15 = 'K'; label.temp.L15 = 'temperature';
data.L30  = 3;        units.L30  = 'cm'; label.L30  = 'total length at 30 d'; bibkey.L30  = 'FAO'; 
  temp.L30 = C2K(28); units.temp.L30 = 'K'; label.temp.L30 = 'temperature';
data.Lj  = 2;         units.Lj  = 'cm';  label.Lj  = 'total length at metam'; bibkey.Lj  = 'Wiki'; 
data.Lp  = 20;        units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = {'Wiki', 'ADW'}; 
data.Li  = 210;       units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwi = 39500;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'ADW';
  comment.Wwi = 'fishbase: 40 kg';

data.Ri  = 2e6/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.032	0.285
0.032	1.995
0.057	2.850
0.057	4.561
0.097	8.266
0.113	12.257
0.113	13.967
0.113	15.107
0.122	23.088
0.713	52.162
0.681	55.867
0.721	57.292
0.697	60.143
0.721	61.853
0.705	65.273
1.094	57.292
1.094	58.717
1.086	62.423
1.661	75.819
1.645	80.380
1.653	87.221
2.229	86.651
2.342	74.964
2.358	70.404
3.233	83.800
3.209	87.221
3.639	79.810
3.639	84.656
4.263	84.941
4.344	99.192
4.449	95.772
4.627	92.352];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d 
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FuruOhsh2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [... % time since birth (yr), fork length (cm)
0.008	1.425
0.041	3.420
0.041	5.131
0.113	8.836
0.122	12.542
0.122	14.252
0.122	16.532
0.138	23.658
0.713	55.867
0.705	61.853
0.883	61.853
0.875	67.553
0.883	69.264
0.997	76.675
1.102	60.713
1.361	66.983
1.726	69.264
2.464	76.105
3.250	84.941
3.250	87.506
3.355	88.646
3.250	91.211
3.250	93.492
3.339	95.202
3.339	97.482
3.250	99.762
3.339	101.758
3.339	103.753
4.019	102.328
4.457	101.188
5.032	101.473
5.024	104.608
5.016	110.309];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FuruOhsh2012';
comment.tL_m = 'Data for males';
  
% length-weight
data.LW_f = [ ... % fork length (cm), wet weight (g)
30.341	327.400
37.768	518.847
42.571	612.867
48.259	908.552
53.082	1357.872
57.676	1604.504
63.371	2052.460
66.019	2606.701
71.949	3358.860
77.424	3756.400
83.575	4558.975
87.965	5059.733
94.342	6014.239
98.542	7022.909
110.008	9289.264
112.644	9640.476
127.832	12154.826];
units.LW_f = {'cm', 'g'};     label.LW_f = {'fork length', 'wet weight', 'female'};  
bibkey.LW_f = 'FAO';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % fork length (cm), wet weight (g)
26.863	535.879
31.884	629.558
36.473	774.676
43.251	1068.658
47.624	1264.874
52.008	1664.118
56.837	2214.951
61.436	2563.097
65.823	3013.098
73.081	4118.513
76.599	4620.633
81.643	5120.369
87.347	5720.598
93.092	7082.182
96.447	8599.786
102.393	9656.487
108.492	9494.677
112.195	13397.524
118.826	15011.531
124.086	15460.169
127.278	22003.407
135.086	21179.030];
units.LW_m = {'cm', 'g'};     label.LW_m = {'fork length', 'wet weight', 'male'};  
bibkey.LW_m = 'FAO';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6B72Q'; % Cat of Life
metaData.links.id_ITIS = '168791'; % ITIS
metaData.links.id_EoL = '46578341'; % Ency of Life
metaData.links.id_Wiki = 'Coryphaena_hippurus'; % Wikipedia
metaData.links.id_ADW = 'Coryphaena_hippurus'; % ADW
metaData.links.id_Taxo = '45259'; % Taxonomicon
metaData.links.id_WoRMS = '126846'; % WoRMS
metaData.links.id_fishbase = 'Coryphaena-hippurus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coryphaena_hippurus}}';
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
bibkey = 'FuruOhsh2012'; type = 'Article'; bib = [ ... 
'author = {S. Furukawa and S. Ohshimo and S. Tomoe and T. Shiraishi and N. Nakatsukaa and R. Kawabe}, ' ... 
'year = {2012}, ' ...
'title = {Age, growth, and reproductive characteristics of dolphinfish \emph{Coryphaena hippurus} in the waters off west {K}yushu, northern {E}ast {C}hina {S}ea}, ' ...
'journal = {Fish Sci}, ' ...
'doi = {10.1007/s12562-012-0557-6}, '...
'howpublished = {http://download.springer.com/static/pdf/511/art%%253A10.1007%%252Fs12562-012-0557-6.pdf?auth66=1413301941_de41c078b5e2f21f8f967689c3e46b50&ext=.pdf}, '...
'volume = {78}, ' ...
'pages = {1153-1162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/6}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Coryphaena_hippurus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bluereef'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.bluereefphoto.org/blog/2014/4/larval-rearing-of-the-mahimahi-coryphaena-hippurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FAO'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/docrep/017/ap934e/ap934e.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

