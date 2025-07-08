function [data, auxData, metaData, txtData, weights] = mydata_Hierophis_viridiflavus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Hierophis_viridiflavus'; 
metaData.species_en = 'Green whip snake'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'biFm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ap = 4*365;     units.ap = 'd';      label.ap = 'age at puberty';       bibkey.ap = 'FornBonn2016';
  temp.ap = C2K(18); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 33*365;    units.am = 'd';      label.am = 'life span';            bibkey.am = 'FornBonn2016';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 25;   units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';           bibkey.Lb  = 'FornBonn2016';
data.Li  = 108;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'FornBonn2016';
data.Lim = 120;   units.Lim  = 'cm'; label.Lim = 'ultimate SVL for males';    bibkey.Lim  = 'FornBonn2016';
  comment.Lim = 'based on Li';

data.Wwi = 1678;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';
   comment.Wwi = 'based on Thamnophis gigas, which has similar size and shape';
  
data.Ri  = 15/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 15 eggs per litter';
  
% univariate data
% time-length
data.tL_fC = [ ... % time since birth (yr), SVL (cm)
0.878	32.536
2.870	46.178
5.891	68.529
5.973	46.155
6.854	74.333
7.887	75.778
8.096	71.999
9.815	81.285
9.949	87.966
9.960	69.661
10.911	95.223
11.953	81.560
12.848	84.749
12.849	81.844
14.771	98.391
14.845	89.384
14.916	86.478
19.949	88.184];
data.tL_fC(:,1) = data.tL_fC(:,1) * 365; % convert yr to d
units.tL_fC  = {'d', 'cm'};  label.tL_fC = {'time since birth', 'SVL', 'female'};  
temp.tL_fC   = C2K(21);  units.temp.tL_fC = 'K'; label.temp.tL_fC = 'temperature';
bibkey.tL_fC = 'FornBonn2016';
comment.tL_fC = 'data for females at Chize, 10 to 28 C';
%
data.tL_mC = [ ... % time since birth (yr), SVL (cm)
0.191	27.602
0.192	24.986
5.006	48.487
10.015	94.358
10.914	89.122
10.918	81.567
10.921	77.790
11.809	92.892
11.812	87.081
12.839	100.439
12.840	97.534
12.844	90.560
13.885	80.383
14.843	93.161
15.045	101.586
15.874	99.546
15.880	87.923
16.015	93.152
16.838	101.282
16.914	89.369
17.043	105.639
18.900	114.342
18.910	96.618
20.833	111.132
23.942	100.359];
data.tL_mC(:,1) = data.tL_mC(:,1) * 365; % convert yr to d
units.tL_mC  = {'d', 'cm'};  label.tL_mC = {'time since birth', 'SVL', 'male'};  
temp.tL_mC   = C2K(21);  units.temp.tL_mC = 'K'; label.temp.tL_mC = 'temperature';
bibkey.tL_mC = 'FornBonn2016';
comment.tL_mC = 'data for males at Chize, 10 to 28 C';
%
data.tL_fM = [ ... % time since birth (yr), SVL (cm)
0.000	24.843
10.861	58.558
14.834	65.434
15.788	59.889
16.901	69.427
17.748	66.100
17.960	73.420
19.126	69.871
19.921	73.420
19.921	68.096
21.987	69.427
23.841	76.747];
data.tL_fM(:,1) = data.tL_fM(:,1) * 365; % convert yr to d
units.tL_fM  = {'d', 'cm'};  label.tL_fM = {'time since birth', 'SVL', 'female'};  
temp.tL_fM   = C2K(19);  units.temp.tL_fM = 'K'; label.temp.tL_fM = 'temperature';
bibkey.tL_fM = 'FornBonn2016';
comment.tL_fM = 'data for females at Montecristo, 15 to 27 C';
%
data.tL_mM = [ ... % time since birth (yr), SVL (cm)
0.106	24.843
13.828	62.107
16.954	67.431
17.060	62.994
19.868	64.104
20.980	72.089
21.934	73.420
23.099	67.874
23.841	80.074
23.842	78.078
24.954	72.311
26.861	72.532
27.762	77.412
28.980	75.638];
data.tL_mM(:,1) = data.tL_mM(:,1) * 365; % convert yr to d
units.tL_mM  = {'d', 'cm'};  label.tL_mM = {'time since birth', 'SVL', 'male'};  
temp.tL_mM   = C2K(19);  units.temp.tL_mM = 'K'; label.temp.tL_mM = 'temperature';
bibkey.tL_mM = 'FornBonn2016';
comment.tL_mM = 'data for males at Montecristo, 15 to 27 C';
%
data.tL_fc = [ ... % time since birth (yr), SVL (cm)
0.100	25.650
0.995	29.671
1.948	33.915
2.794	40.611
3.908	39.502
13.758	78.144
16.783	77.492
21.028	74.393
21.929	76.851];
data.tL_fc(:,1) = data.tL_fc(:,1) * 365; % convert yr to d
units.tL_fc  = {'d', 'cm'};  label.tL_fc = {'time since birth', 'SVL', 'female'};  
temp.tL_fc   = C2K(20);  units.temp.tL_fc = 'K'; label.temp.tL_fc = 'temperature';
bibkey.tL_fc = 'FornBonn2016';
comment.tL_fc = 'data for females of H. v. carbonarius at Calimera, 13 to 32 C';
%
data.tL_mc = [ ... % time since birth (yr), SVL (cm)
0.011	25.428
0.836	28.778
1.736	33.244
6.820	53.347
8.837	51.351
11.747	67.426
12.859	73.455
13.923	66.769
16.943	74.593
17.947	84.413
18.796	82.633
19.857	83.754
19.858	80.631
19.907	89.108
20.914	93.128
21.979	82.205
22.724	78.417
24.844	83.336
25.849	88.695
25.853	81.111
26.861	79.778
32.797	91.856];
data.tL_mc(:,1) = data.tL_mc(:,1) * 365; % convert yr to d
units.tL_mc  = {'d', 'cm'};  label.tL_mc = {'time since birth', 'SVL', 'male'};  
temp.tL_mc   = C2K(20);  units.temp.tL_mc = 'K'; label.temp.tL_mc = 'temperature';
bibkey.tL_mc = 'FornBonn2016';
comment.tL_mc = 'data for males of H. v. carbonarius at Calimera, 13 to 32 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fC = 3 * weights.tL_fC;
weights.tL_mC = 3 * weights.tL_mC;
weights.tL_fM = 3 * weights.tL_fM;
weights.tL_mM = 3 * weights.tL_mM;
weights.tL_fc = 3 * weights.tL_fc;
weights.tL_mc = 3 * weights.tL_mc;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fC','tL_mC'}; subtitle1 = {'Data for females, males at Chize'};
set2 = {'tL_fM','tL_mM'}; subtitle2 = {'Data for females, males at Montecristo'};
set3 = {'tL_fc','tL_mc'}; subtitle3 = {'Data for females, males of H. v. carbonarius at Calimera'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LVTR'; % Cat of Life
metaData.links.id_ITIS = '1081699'; % ITIS
metaData.links.id_EoL = '795303'; % Ency of Life
metaData.links.id_Wiki = 'Hierophis_viridiflavus'; % Wikipedia
metaData.links.id_ADW = 'Hierophis_viridiflavus'; % ADW
metaData.links.id_Taxo = '644702'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Hierophis&species=viridiflavus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hierophis_viridiflavus}}';
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
bibkey = 'FornBonn2016'; type = 'Article'; bib = [ ... 
'doi = {10.13128/Acta_Herpetol-18695}, ' ...
'title = {Growth, longevity and age at maturity in the {E}uropean whip snakes, \emph{Hierophis viridiflavus} and \emph{H. carbonarius}}, ' ...
'journal = {Acta Herpetologica}, ' ...
'year = {2016}, ' ...
'author = {Sara Fornasiero and Xavier Bonnet and Federica Dendi and Marco A.L. Zuffi}, ' ....
'volume = {11(2)}, ' ...
'pages = {135-149}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1055211/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

