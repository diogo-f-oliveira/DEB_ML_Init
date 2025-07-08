function [data, auxData, metaData, txtData, weights] = mydata_Strauchbufo_raddei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Strauchbufo_raddei'; 
metaData.species_en = 'Mongolian toad'; 

metaData.ecoCode.climate = {'BSk','BWk','Dw'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFm','jiTf','jiTs','jiTd','jiTa','jiTi'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 24];

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Kuzm2017';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '1-2 wk';
data.tp = 2.5*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.4;   units.Lj  = 'cm';  label.Lj  = 'SVL for females at metam';   bibkey.Lj  = 'Kuzm2017';
data.Li  = 8.9;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'amphibiaweb';
data.Lim  = 8.9; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'guess';
  comment.Lim = 'amphibiaweb: males are smaller than females, but this is not clear from tL data';

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 87.1;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Bufo bufo: 417*(8.9/15)^3';
data.Wwim = 87.1;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Bufo bufo: 417*(8.9/15)^3';

data.Ri  = 3500/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'amphibiaweb';   
temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1070-6000  eggs per clutch, 1 clutch per yr'; 

% uni-variate data
% time-length
data.tL_Uf = [ ... % time since birth (yr), SVL (cm)
0.993	2.895
3.002	3.857
3.063	4.895
3.968	6.368
3.995	5.797
3.996	6.098
4.009	5.421
4.009	5.496
4.009	5.571
4.010	5.647
4.023	5.075
4.983	5.180
4.983	5.511
4.984	5.571
4.984	5.662
4.984	5.827
4.984	5.932
4.985	6.038
4.985	6.098
4.998	5.376
5.973	6.053
5.987	5.737
6.991	5.917];	
data.tL_Uf(:,1) = (data.tL_Uf(:,1) + 0.5) * 365; % convert yr to d
units.tL_Uf   = {'d', 'cm'};  label.tL_Uf = {'time since birth', 'SVL'};  
temp.tL_Uf    = C2K(10); units.temp.tL_Uf = 'K'; label.temp.tL_Uf = 'temperature';
bibkey.tL_Uf = 'KuzmIsch1997'; 
comment.tL_Uf = 'Data for females from Ugii-Nuur Lake';
%
data.tL_Um = [ ... % time since birth (yr), SVL (cm)
2.977	5.421
3.023	6.398
4.971	6.383
4.983	5.271
4.986	6.519
4.999	5.857
5.971	5.135
5.971	5.180
5.972	5.316
6.002	5.812
6.991	6.128
7.020	5.947
7.020	5.992];	
data.tL_Um(:,1) = (data.tL_Um(:,1) + 0.5) * 365; % convert yr to d
units.tL_Um   = {'d', 'cm'};  label.tL_Um = {'time since birth', 'SVL'};  
temp.tL_Um    = C2K(10); units.temp.tL_Um = 'K'; label.temp.tL_Um = 'temperature';
bibkey.tL_Um = 'KuzmIsch1997'; 
comment.tL_Um = 'Data for males from Ugii-Nuur Lake';
%
data.tL_Vf = [ ... % time since birth (yr), SVL (cm)
0.001	1.345
0.001	1.435
0.001	1.481
0.001	1.571
0.002	1.782
0.995	3.030
0.995	3.151
0.996	3.437
0.996	3.497
0.997	3.573
0.997	3.693
0.997	3.935
0.999	4.492
1.008	2.502
1.010	2.940
1.012	4.161
1.014	4.719
1.025	3.241
1.037	2.080
2.000	2.876
2.000	2.982
2.000	3.102
2.001	3.238
2.001	3.298
2.004	4.625
2.004	4.700
2.005	4.956
2.006	5.665
2.007	6.057
2.016	3.404
2.016	3.479
2.016	3.630
2.016	3.630
2.016	3.690
2.018	4.444
2.019	4.866
2.980	4.953
2.981	5.149
2.993	4.109
2.993	4.245
2.994	4.425
3.006	3.340
3.006	3.581
3.006	3.687
3.007	3.777
3.009	4.832
3.012	5.767
3.022	3.898
3.022	4.003
3.038	4.651
3.978	2.010
3.985	4.693
3.987	5.734
3.988	5.930
4.001	5.432
4.976	5.037
4.977	5.444
4.977	5.610
5.003	4.223
5.008	6.152
5.022	5.926
5.968	5.863
5.968	6.029
5.970	6.496
6.958	5.528
6.988	5.965
6.988	6.131
7.993	6.218];	
data.tL_Vf(:,1) = (data.tL_Vf(:,1) + 0.5) * 365; % convert yr to d
units.tL_Vf   = {'d', 'cm'};  label.tL_Vf = {'time since birth', 'SVL'};  
temp.tL_Vf    = C2K(10); units.temp.tL_Vf = 'K'; label.temp.tL_Vf = 'temperature';
bibkey.tL_Vf = 'KuzmIsch1997'; 
comment.tL_Vf = 'Data for females from Valley of Lakes, Mongolia';
%
data.tL_Vm = [ ... % time since birth (yr), SVL (cm)
2.006	5.288
2.006	5.499
2.983	5.918
2.994	4.712
3.011	5.435
3.011	5.616
3.025	5.224
3.025	5.270
3.973	6.096
3.974	6.276
3.985	4.844
3.985	4.950
4.016	5.477
4.016	5.568
4.950	6.469
4.964	6.002
4.964	6.107
4.964	6.273
4.991	5.127
5.954	6.255
7.994	6.444
7.994	6.519
7.994	6.549
9.011	5.717
9.012	5.913];	
data.tL_Vm(:,1) = (data.tL_Vm(:,1) + 0.5) * 365; % convert yr to d
units.tL_Vm   = {'d', 'cm'};  label.tL_Vm = {'time since birth', 'SVL'};  
temp.tL_Vm    = C2K(10); units.temp.tL_Vm = 'K'; label.temp.tL_Vm = 'temperature';
bibkey.tL_Vm = 'KuzmIsch1997'; 
comment.tL_Vm = 'Data for males from Valley of Lakes';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Uf = 5 * weights.tL_Uf;
weights.tL_Vf = 5 * weights.tL_Vf;
% weights.Wwim = 0 * weights.Wwim;
% weights.Lim = 0 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Uf','tL_Um'}; subtitle1 = {'Data for females, males from Ugii-Nuur Lake, Mongolia'};
set2 = {'tL_Vf','tL_Vm'}; subtitle2 = {'Data for females, males from Valley of Lakes, Mongolia'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '52WPG'; % Cat of Life
metaData.links.id_ITIS = '1103474'; % ITIS
metaData.links.id_EoL = '46396206'; % Ency of Life
metaData.links.id_Wiki = 'Strauchbufo_raddei'; % Wikipedia
metaData.links.id_ADW = 'Bufo_raddei'; % ADW
metaData.links.id_Taxo = '5686323'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Strauchbufo+raddei'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Strauchbufo_raddei}}';
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
bibkey = 'KuzmIsch1997'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1565404}, ' ...
'author = {Kuzmin, S. L. and Ischenko, V. G.}, ' ... 
'year = {1997}, ' ...
'title = {Skeletochronology of \emph{Bufo raddei} from the {G}obi {D}esert}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {31(2)}, ' ...
'pages = {306-309}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kuzm2017'; type = 'Book'; bib = [ ... 
'howpublished = {\url{https://amphibiaweb.org/refs/pdfs/Kuzmin_Amphibia_Mongolia.pdf}}, ' ...
'author = {Kuzmin, S. L.}, ' ... 
'year = {2017}, ' ...
'title = {The Amphibians of Mongolia}, ' ...
'publisher = {KMK Scientific Press, Moscow}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Strauchbufo+raddei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

