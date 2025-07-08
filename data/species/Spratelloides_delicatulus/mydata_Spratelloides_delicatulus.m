function [data, auxData, metaData, txtData, weights] = mydata_Spratelloides_delicatulus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Spratelloididae';
metaData.species    = 'Spratelloides_delicatulus'; 
metaData.species_en = 'Delicate round herring'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW', 'MI'};
metaData.ecoCode.habitat = {'0iMcp', '0iMr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 03 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 10]; 


%% set data
% zero-variate data;

data.am = 6*30.5;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'MiltBlab1991';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 4;   units.Lp  = 'cm';   label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
  comment.Lp = 'based on same realtive length, compared to Spratelloides_gracilis: 4/10.5*6 cm';
data.Li  = 7; units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'Wiki';

data.Wwb = 4.8e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ShirWata2007';
  comment.Wwb = 'based on egg diameter of  0.45 mm of Spratelloides_gracilis: pi/6*0.045^3';
data.Wwi = 1.97;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.13, see F1';

data.Ri  = 867*1.97/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(28.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL_Nov = [ % time since birth (d), standard length (cm)
21.429	1.663
24.214	1.904
25.500	1.992
26.357	1.905
26.357	1.686
26.571	1.796
28.286	1.992
28.286	2.189
29.143	2.320
30.214	2.516
30.643	2.320
31.714	2.495
32.571	2.604
33.000	2.495
33.000	2.343
36.000	2.714
37.286	2.431
37.714	3.391
38.143	2.933
38.571	3.588
39.643	3.021
40.714	3.130
40.929	2.890
41.786	3.501
42.214	2.454
42.429	3.458
42.429	3.719
42.643	3.218
43.929	3.458
44.143	3.349
44.357	3.785
44.571	2.716
45.000	3.655
45.000	3.524
45.857	3.349
46.929	3.808
47.143	3.961
48.000	4.004
50.357	3.830
54.000	3.722
79.286	4.361];  
units.tL_Nov = {'d', 'cm'};  label.tL_Nov = {'time since birth', 'standard length', 'Townville, nov 1989'};  
temp.tL_Nov = C2K(28.1);  units.temp.tL_Nov = 'K'; label.temp.tL_Nov = 'temperature';
bibkey.tL_Nov = 'MiltBlab1991';
comment.tL_Nov = 'Data from Townville, nov 1989';
%
data.tL_Dec = [ % time since birth (d), standard length (cm)
19.169	1.809
19.172	1.854
20.464	1.766
21.118	1.833
22.206	1.922
23.288	1.923
24.374	1.990
25.482	2.346
25.889	1.991
28.038	1.792
29.365	2.192
32.213	2.683
34.137	2.372
35.670	2.618
46.393	4.312
49.140	3.402
51.199	4.959
54.861	4.738
55.885	3.939
58.142	5.229
60.747	5.363
66.150	5.277
76.280	4.749
79.530	4.817
80.190	4.973
84.787	5.709];  
units.tL_Dec = {'d', 'cm'};  label.tL_Dec = {'time since birth', 'standard length', 'Townville, dec 1989'};  
temp.tL_Dec = C2K(28.1);  units.temp.tL_Dec = 'K'; label.temp.tL_Dec = 'temperature';
bibkey.tL_Dec = 'MiltBlab1991';
comment.tL_Dec = 'Data from Townville, dec 1989';
%
data.tL_Jan = [ % time since birth (d), standard length (cm)
18.732	1.722
20.239	1.811
21.962	1.677
23.254	1.721
23.684	2.053
24.330	1.810
24.330	1.566
24.545	1.987
24.545	1.876
25.407	2.053
25.622	2.163
26.053	2.252
26.483	2.075
26.914	1.897
27.129	1.765
28.421	2.274
29.067	2.273
29.713	2.517
30.359	2.251
30.789	2.428
31.220	2.981
31.435	2.804
31.651	2.206
33.158	2.516
34.234	3.113
34.234	2.981
34.880	2.980
37.679	3.179
40.478	3.090
49.306	4.394
51.029	4.482
52.105	4.393
53.182	4.504
53.182	4.105
54.904	4.415
56.842	4.702
58.349	5.255
58.565	4.480
62.010	5.298
62.010	5.431];  
units.tL_Jan = {'d', 'cm'};  label.tL_Jan = {'time since birth', 'standard length', 'Townville, jan 1990'};  
temp.tL_Jan = C2K(28.1);  units.temp.tL_Jan = 'K'; label.temp.tL_Jan = 'temperature';
bibkey.tL_Jan = 'MiltBlab1991';
comment.tL_Jan = 'Data from Townville, jan 1990';


%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 5 * weights.Ri;
weights.Lp = 5 * weights.Lp;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Nov', 'tL_Dec', 'tL_Jan'}; subtitle1 = {'Data for Townville, nov, dec 1989, jan 1990'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00447*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'standard-total length: SL = TL * 0.87';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4ZDQ2'; % Cat of Life
metaData.links.id_ITIS = '161785'; % ITIS
metaData.links.id_EoL = '46562434'; % Ency of Life
metaData.links.id_Wiki = 'Spratelloides_delicatulus'; % Wikipedia
metaData.links.id_ADW = 'Spratelloides_delicatulus'; % ADW
metaData.links.id_Taxo = '94360'; % Taxonomicon
metaData.links.id_WoRMS = '126424'; % WoRMS
metaData.links.id_fishbase = 'Spratelloides-delicatulus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spratelloides_delicatulus}}';
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
bibkey = 'ShirWata2007'; type = 'Article'; bib = [ ... 
'author = {Norio Shirafuji  and Yoshiro Watanabe and Yasuyuki Takeda and  Tomohiko Kawamura}, ' ... 
'year = {2007}, ' ...
'title = {Maturation and spawning of \emph{Spratelloides gracilis} {C}lupeidae in temperate waters off {C}ape {S}hionomisaki, central {J}apan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {73}, ' ...
'pages = {623-632}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiltBlab1991'; type = 'Article'; bib = [ ... 
'author = {D. A. Milton and S. J. M. Blaber and N. J. F. Rawlinson}, ' ... 
'year = {1991}, ' ...
'title = {Age and growth of three species of tuna baitfish (genus: \emph{Spratelloides) in the tropical {I}ndp-{P}acific}}, ' ...
'journal = {Journal of fish Biology}, ' ...
'volume = {39}, ' ...
'pages = {849-866}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Spratelloides-delicatulus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
