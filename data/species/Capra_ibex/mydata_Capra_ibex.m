function [data, auxData, metaData, txtData, weights] = mydata_Capra_ibex

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Capra_ibex'; 
metaData.species_en = 'Alpine ibex'; 

metaData.ecoCode.climate = {'ET', 'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww','t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 169;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 274;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 797;    units.tp = 'd';    label.tp = 'time since birth at puberty of females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1256;    units.tpm = 'd';    label.tpm = 'time since birth at puberty of males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20.9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 2850;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwi = 30e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '17 till 32 kg';
data.Wwim = 95e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = '67 till 117 kg';
  
data.Ri  = 1.1*0.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.1 calves per litter, 0.8 litters per yr';

% uni-variate data
% time-weight
data.tL_f = [ % time since birth (yr), chest girth (cm)
0.940	65.432
0.941	64.691
0.941	63.827
0.979	60.494
0.979	59.630
0.979	58.889
0.980	56.173
1.974	72.346
1.974	71.605
1.974	70.741
1.974	70.370
1.975	69.630
1.975	69.012
2.951	80.988
2.952	80.617
2.952	80.247
2.969	84.444
3.911	87.654
3.931	83.333
3.936	63.827
3.966	90.370
3.967	84.568
3.969	79.259
3.969	78.272
3.971	70.370
3.991	65.802
4.004	85.556
4.930	78.025
4.964	90.864
4.964	89.012
5.004	80.000
5.944	88.642
5.981	91.481
7.978	90.370
7.978	89.753
7.996	88.642
8.975	92.222
10.991	90.000
10.991	89.383
10.991	88.889]; 
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'chest girth', 'female'};  
temp.tL_f  = C2K(38.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ToigGail1999';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), chest girth (cm)
0.938	74.568
0.938	73.704
0.940	67.654
0.955	79.136
0.957	72.593
0.976	71.728
0.976	70.741
0.976	69.506
0.977	66.543
0.977	65.432
0.997	61.605
1.970	88.889
1.970	87.407
1.970	86.667
1.970	85.926
1.971	84.074
1.971	83.951
1.971	83.086
1.971	81.975
1.972	80.988
1.972	80.000
1.972	78.519
1.972	77.654
1.973	76.420
1.973	74.568
1.973	73.951
1.992	75.679
1.992	72.716
2.008	84.938
2.929	96.173
2.935	74.198
2.947	98.272
2.951	82.346
2.967	92.716
2.967	91.728
2.967	90.864
2.968	87.901
2.969	86.420
2.969	85.679
2.970	78.889
3.002	101.235
3.944	100.988
3.945	99.877
3.946	95.802
3.946	94.444
3.947	92.840
3.961	108.519
3.966	88.519
4.960	104.815
4.961	102.840
4.980	101.975
4.996	108.148
5.957	109.136
5.958	108.025
5.958	105.679
5.959	101.728
5.960	100.741
5.960	99.877
5.977	104.198
6.937	110.617
6.957	105.185
7.955	107.284
7.955	106.173
8.914	114.321
8.914	113.210
8.915	111.728
9.912	115.062
11.966	108.642]; 
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'chest girth', 'male'};  
temp.tL_m  = C2K(38.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ToigGail1999';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;

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
D1 = 'Slow/fast parameter for foetal development point to rather slow development';
D2 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D3 = 'Body temperature is guessed based on Rupicapra';
D4 = 'mod_1: males have equal state variables at b, compared to females';
mmetaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'QS69'; % Cat of Life
metaData.links.id_ITIS = '625139'; % ITIS
metaData.links.id_EoL = '328692'; % Ency of Life
metaData.links.id_Wiki = 'Capra_ibex'; % Wikipedia
metaData.links.id_ADW = 'Capra_ibex'; % ADW
metaData.links.id_Taxo = '68570'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200783'; % MSW3
metaData.links.id_AnAge = 'Capra_ibex'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Capra_ibex}}';
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
bibkey = 'ToigGail1999'; type = 'article'; bib = [ ... 
'author = {C. To\"{i}go and J.-M. Gaillard and J. Michallet}, ' ... 
'year = {1999}, ' ...
'title = {Cohort affects growth of males but not of females in {A}lpine ibex (\emph{Capra ibex ibex})}, ' ...
'journal = {J Mammol}, ' ...
'volume = {80}, ' ...
'pages = {1021--1027}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Capra_ibex}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Capra_ibex/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

