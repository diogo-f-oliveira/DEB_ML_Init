function [data, auxData, metaData, txtData, weights] = mydata_Liopholis_guthega

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Liopholis_guthega';
metaData.species_en = 'Snowy Mountains skink';

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 31];

%% set data
% zero-variate data;
data.ab = 2*30;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'based on Liopholis_striata with temp correction';
data.am = 10*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';
comment.am = 'based on Liopholis_striata';

data.Lb  = 4.7;     units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'AtkiClem2019';
data.Lp  = 7.5;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'AtkiClem2019';
data.Li  = 10.5; units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'AtkiClem2019';

data.Wwi = 40.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
comment.Wwi = 'based on Liopholis_striata';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';
temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'based on Liopholis_striata';

% uni-variate data
data.tL_B = [... % time since birth (yr), SVL (cm)
0.00252	4.77493
0.01258	5.02937
0.01258	4.66381
0.02013	4.90228
0.02767	4.58447
0.99371	5.48307
1.00126	6.97717
1.00126	6.83413
1.00126	6.69108
1.00126	6.45267
1.00126	5.99174
1.00881	6.53221
1.00881	5.08585
1.01635	5.29254
2.00503	8.09862
2.00503	7.41517
2.01258	7.52650
2.98616	9.82384
3.00881	9.10881
3.00881	8.91808
3.00881	8.36179
3.00881	8.23463
3.00881	7.77371
3.01635	9.36318
3.01635	8.48901
3.98994	8.56118
3.98994	8.44992
3.99748	8.81555
4.00503	9.95999
4.00503	9.65800
4.00503	9.13350
4.00503	8.68846
4.01258	8.99052
4.01258	8.35476
4.96352	9.20554
4.98616	9.58719
4.99371	9.26938
5.00126	9.20587
5.00881	9.46024
5.00881	9.01521
5.00881	8.88806
5.00881	8.61786];
data.tL_B(:,1) = data.tL_B(:,1)*365; % convert yr to d
units.tL_B  = {'d', 'cm'};  label.tL_B = {'time since birth', 'SVL', 'Bogong High Plains, Victoria'};  
temp.tL_B   = C2K(14);  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';
bibkey.tL_B = 'AtkiClem2019';
comment.tL_B = 'Data from Bogong High Plains, Victoria, 1600-1700 m elevation';
%
data.tL_K = [... % time since birth (yr), SVL (cm)
0.00645	4.84540
0.00041	4.23483
0.00057	4.40705
0.00062	4.46967
0.00073	4.57926
0.00083	4.68885
0.99076	7.17808
0.99086	7.28767
0.99222	8.74364
0.99743	6.36399
0.99758	6.52055
0.99788	6.84932
0.99806	7.03718
0.99937	8.44618
0.99987	8.99413
1.99591	10.05871
1.99620	10.37182
1.99632	10.49707
2.00116	7.71037
2.00287	9.55773
2.00321	9.91781
2.00911	8.27397
2.00970	8.91585
2.01001	9.24462
2.01039	9.65166
2.01052	9.79256
2.01759	9.41683
2.99108	10.18395
2.99160	10.74755
2.99178	10.93542
2.99189	11.06067
2.99221	11.40509
2.99876	10.46575
3.00529	9.49511
3.00541	9.62035
3.00551	9.72994
3.00567	9.90215
3.00578	10.02740
3.01347	10.30920
4.00044	9.60470
4.00093	10.13699
4.00139	10.62231
4.00152	10.76321
4.00865	10.45010
4.01595	10.30920
4.98929	10.91977
5.99176	10.91977
5.99831	9.98043
6.00552	9.74560];
data.tL_K(:,1) = data.tL_K(:,1)*365; % convert yr to d
units.tL_K  = {'d', 'cm'};  label.tL_K = {'time since birth', 'SVL', 'Kosciuszko NP, New South Wales'};  
temp.tL_K   = C2K(14);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'AtkiClem2019';
comment.tL_K = 'Data from Kosciuszko NP, New South Wales, 1650-2170 m elevation';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_B = 3 * weights.tL_B;
weights.tL_K = 3 * weights.tL_K;
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_B','tL_K'}; subtitle1 = {'Data from Victoria, NSW'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3V7BV'; % Cat of Life
metaData.links.id_ITIS = '1182947'; % ITIS
metaData.links.id_EoL = '793910'; % Ency of Life
metaData.links.id_Wiki = 'Liopholis_guthega'; % Wikipedia
metaData.links.id_ADW = 'Egernia_guthega'; % ADW
metaData.links.id_Taxo = '4683944'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Liopholis&species=guthega'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Liopholis_guthega}}';   
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
bibkey = 'AtkiClem2019'; type = 'Article'; bib = [ ...  
'doi = {10.1111/jzo.12728}, ' ...
'author = {Z. S. Atkins and N. Clemann and D. G. Chapple and A. M. Edwards and U. Sinsch and A. M. Hantzschmann and M. Schroder and M. P. Scroggie and K. A. Robert}, ' ...
'title = {Demographic and life history variation in two sky-island populations of an endangered alpine lizard}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {310}, ' ...
'pages = {34-44}, ' ...
'year = {2019}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
