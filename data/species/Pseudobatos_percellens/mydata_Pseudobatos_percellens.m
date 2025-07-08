function [data, auxData, metaData, txtData, weights] = mydata_Pseudobatos_percellens

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Rhinobatidae';
metaData.species    = 'Pseudobatos_percellens'; 
metaData.species_en = 'Brazilian guitarfish';

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMcd','0iMm'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 05];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 6*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(26.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'fishbase gives 3-4 mnth';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'CaltSide2019';   
  temp.am = C2K(26.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'RochGadi2013';
data.Lp  = 58.3;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'RochGadi2013'; 
data.Lpm  = 54.8;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'RochGadi2013'; 
data.Li  = 100;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwi = 4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00309*Li^3.06, see F1';

data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'RochGadi2013';   
  temp.Ri = C2K(26.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-13 pups per litter; assumed 1 litter per 1 yr';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	26.943
0.000	30.317
0.793	31.492
0.793	35.462
0.794	36.653
0.813	38.837
0.813	41.020
0.813	42.608
1.787	45.768
1.787	47.754
1.788	49.540
1.788	52.121
1.823	43.783
1.841	41.400
1.841	42.591
2.708	63.024
2.708	64.413
2.762	60.045
2.763	62.030
2.763	62.030
2.778	48.928
2.779	50.715
2.798	53.295
2.798	54.883
2.799	58.059
2.801	66.794
3.757	74.718
3.773	67.175
3.773	67.969
3.774	69.954
3.790	60.028
3.793	71.740
3.793	73.130
3.810	65.388
3.846	63.799
3.863	58.042
3.882	62.012
4.819	67.356
4.820	68.944
4.820	71.128
4.837	66.165
4.839	73.509
5.793	73.097
5.812	74.287
5.829	71.905
5.831	78.853
6.803	76.058
6.803	77.646
6.860	86.975
7.779	91.922
7.815	87.158
8.841	82.178
10.845	101.996];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
  temp.tL_f = C2K(26.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CaltSide2019';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.132	31.106
0.186	26.142
1.125	42.802
1.180	38.831
1.180	40.419
1.197	32.875
2.192	52.908
2.192	54.496
2.193	55.687
2.193	56.283
2.208	41.593
2.208	43.181
2.208	43.975
2.209	45.761
2.209	46.555
2.209	47.151
2.246	48.341
2.246	49.731
2.247	51.716
3.165	54.083
3.165	55.671
3.167	65.001
3.168	66.986
3.183	51.899
3.184	56.862
3.185	64.008
3.202	57.457
3.203	61.626
3.203	62.817
3.221	58.846
3.240	60.434
4.175	59.029
4.175	60.220
4.176	61.411
4.176	62.602
4.176	63.793
4.176	64.984
4.195	65.977
4.195	66.969
4.195	68.160
4.196	69.153
5.169	72.114
5.170	74.894
5.170	76.879
5.187	70.526
5.189	78.466
5.204	66.159
5.205	68.938
5.222	64.570
6.162	83.016
6.214	70.708
6.215	72.296
6.216	77.457
6.216	78.052
6.234	75.869
6.289	73.883
6.803	78.440
6.822	79.829
6.822	81.616];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
  temp.tL_m = C2K(26.7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CaltSide2019';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00309 * (TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Ovoviviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4NPQH'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '51263480'; % Ency of Life
metaData.links.id_Wiki = 'Pseudobatos'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5618640'; % Taxonomicon
metaData.links.id_WoRMS = '1043607'; % WoRMS
metaData.links.id_fishbase = 'Pseudobatos-percellens'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudobatos}}'; 
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
bibkey = 'CaltSide2019'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.14123}, ' ...
'author = {Fabio P. Caltabellotta and Zachary A. Siders and Debra J. Murie and Fabio S. Motta and Gregor M. Cailliet and Otto B. F. Gadig}, ' ... 
'year = {2019}, ' ...
'title = {Age and growth of three endemic threatened guitarfishes \emph{Pseudobatos horkelii}, \emph{P. percellens} and \emph{Zapteryx brevirostris} in the western {S}outh {A}tlantic {O}cean}, ' ...
'journal = {J Fish Biol.}, ' ...
'volume = {95}, ' ...
'pages = {1236-1248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RochGadi2013'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2012.03493.x}, ' ...
'author = {F. Rocha and Otto B. F. Gadig}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of the guitarfish \emph{Rhinobatos percellens} ({C}hondrichthyes, {R}hinobatidae) from the {S}\~{a}o {P}aulo Coast, {B}razil, western {S}outh {A}tlantic {O}cean}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {82}, ' ...
'pages = {306-317}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pseudobatos-percellens.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 