function [data, auxData, metaData, txtData, weights] = mydata_Diplodon_chilensis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Hyriidae';
metaData.species    = 'Diplodon_chilensis'; 
metaData.species_en = 'Southern lake clam'; 

metaData.ecoCode.climate = {'Csb', 'Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 08]; 

%% set data
% zero-variate data

data.am = 73*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'YussLomo2015';   
  temp.am = C2K(11);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'YussLomo2015';
  comment.Lp = '2.0 till 2.3 cm ';
data.Li  = 8.2;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'RoccLomo2014';

data.Wwb = 7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Based on 306 till 309 mum glochidium length, but rather flat: 0.5*4/3*pi*0.015^3';
data.Wwi = 12.35; units.Wwi = 'g';   label.Wwi = 'ultimate flesh wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on data for Anadonta cygnea: 22.4*(8.2/10)^3';
  
data.Ri  = 1.7e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(11); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on value for kap';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
5.733	3.564
6.490	4.268
6.490	4.448
6.599	3.369
6.707	4.627
7.139	4.388
7.464	3.369
7.464	5.226
7.788	4.043
7.897	4.358
8.762	4.732
8.762	4.882
9.519	4.013
9.844	4.253
9.952	4.777
10.493	5.765
10.601	4.987
10.709	5.616
10.817	5.451
10.817	5.211
11.466	5.032
11.466	4.478
11.575	5.765
11.683	5.241
11.683	5.121
12.007	4.777
12.440	4.313
12.548	4.837
12.656	6.469
12.656	7.038
12.764	6.889
12.764	4.957
12.764	5.181
12.873	6.140
12.873	5.960
13.305	6.245
13.413	5.556
13.522	7.757
13.846	4.358
14.063	5.765
14.063	5.106
14.171	6.035
14.171	5.391
14.495	5.571
14.603	5.047
14.712	6.200
14.712	6.304
14.820	5.691
14.928	5.226
15.036	5.451
15.577	5.002
15.685	5.571
15.793	5.960
15.793	5.166
15.793	5.286
16.442	6.619
16.550	7.488
16.550	6.963
16.550	6.379
16.767	6.844
16.875	7.592
16.875	6.110
16.983	5.691
17.632	7.113
17.632	6.290
17.957	8.072
18.281	6.993
18.606	7.817
18.714	7.383
18.822	7.128
19.687	6.724
19.687	7.757
19.796	6.589
20.228	6.918
20.769	6.844
20.986	6.260
21.851	5.945
21.851	6.769
21.851	8.116
21.959	6.889
21.959	7.502
22.067	6.514
22.716	6.993
22.825	5.705
22.825	5.810
22.825	6.769
23.798	8.431
24.663	7.577
25.853	7.742
25.853	7.083
25.962	6.739
26.719	7.443
27.692	7.562
27.800	5.795
28.558	6.933
28.774	6.529
28.774	7.712
28.774	7.562
29.531	6.799
29.748	7.068
29.748	8.057
30.829	6.978
30.937	7.952
31.803	7.143
32.560	6.889
32.776	7.787
32.993	7.053
33.858	6.424
33.858	6.829
33.966	7.697
34.832	6.993
35.697	7.188
35.697	6.829
35.913	6.619
37.752	7.188
38.726	6.784
38.834	8.042
39.700	7.982
39.808	7.068
40.565	7.368
41.863	7.577
42.837	7.413
43.810	7.488
43.918	6.889
44.675	6.245
49.760	6.619
51.599	7.128
54.952	7.023
57.873	7.323
60.901	6.739
61.010	7.053
73.017	7.622];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(11);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YussLomo2015';
comment.tL = 'Data for Nonthue Lake, Agentina';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 50;
weights.Ri = weights.Ri * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
data.psd.p_M = 3 * data.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6CXQW'; % Cat of Life
metaData.links.id_ITIS = '983808'; % ITIS
metaData.links.id_EoL = '4752473'; % Ency of Life
metaData.links.id_Wiki = 'Diplodon'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1685852'; % Taxonomicon
metaData.links.id_WoRMS = '1258079'; % WoRMS
metaData.links.id_molluscabase = '1258079'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplodon_chilensis}}';
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
bibkey = 'YussLomo2015'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF15158}, ' ...
'author = {Maria S. Yusseppone and Betina J. Lomovasky and Carlos M. Luquet and Maria C. R\''{i}os de Molina and Iara Rocchetta}, ' ... 
'year = {2015}, ' ...
'title = {Age- and sex-dependent changes in morphometric and metabolic variables in the long-lived freshwater mussel \emph{Diplodon chilensis}}, ' ...
'journal = {Marine and Freshwater Research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RoccLomo2014'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.limno.2013.06.004}, ' ...
'author = {Iara Rocchetta and Betina J. Lomovasky and Maria S. Yusseppone and Sebasti\''{a}n E. Sabatini and Flavia Bieczynski and Mar\''{i}a C. R\''{i}os de Molina and Carlos M.Luquet}, ' ... 
'year = {2014}, ' ...
'title = {Growth, abundance,morphometric and metabolic parameters of three populations of \emph{Diplodon chilensis} subject to different levels of natural and anthropogenic organic matter input in a glaciar lake of {N}orth {P}atagonia}, ' ...
'journal = {Limnologica}, ' ...
'volume = {44}, ' ...
'pages = {72-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
