function [data, auxData, metaData, txtData, weights] = mydata_Gazella_subgutturosa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Gazella_subgutturosa'; 
metaData.species_en = 'Goitered gazelle'; 

metaData.ecoCode.climate = {'BSk', 'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 175;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 106;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 646;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 746; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 16.3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(39.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2625;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 13.5e3;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwim = 48.5e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';

data.Ri  = 1.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.3 calves per litter, 1 litter per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (kg)
41.216	5.905
64.768	6.041
64.768	8.075
76.544	5.137
76.544	10.064
82.432	10.788
88.320	6.990
88.320	12.913
88.320	14.043
88.320	16.168
123.649	10.924
135.425	8.709
135.425	10.065
141.313	8.031
229.633	10.926
229.633	17.029
247.297	17.933
247.297	19.877
270.849	18.973
347.394	10.023
365.058	12.962
376.834	14.951
376.834	17.935
382.722	10.928
382.722	19.924
400.386	12.103
400.386	17.935
400.386	19.924
406.274	12.963
406.274	14.952
406.274	16.037
412.162	10.928
412.162	17.031
418.050	13.957
429.826	16.037
429.826	17.936
435.714	11.968
435.714	16.986
441.602	12.963
441.602	18.885
447.490	13.958
447.490	14.952
447.490	17.936
459.266	11.969
459.266	16.942
465.154	16.038
471.042	12.963
471.042	14.953
482.819	17.937
730.116	16.991
747.780	12.922
747.780	14.912
747.780	15.997
747.780	19.839
747.780	20.969
759.556	14.098
759.556	16.946
765.444	10.979
765.444	12.968
765.444	15.997
771.332	14.912
771.332	17.941
771.332	18.981
771.332	22.010
777.220	14.053
777.220	16.042
777.220	16.946
777.220	19.930
777.220	20.970
794.884	14.912
800.772	17.941
800.772	20.970
806.660	14.008
806.660	16.902
812.548	19.976
818.436	17.942
818.436	18.981
818.436	20.970
824.324	16.043
830.212	16.902
836.100	12.969
836.100	14.913
847.876	16.043
859.653	14.009
865.541	16.902
1460.232	17.951
1483.784	17.951
1495.560	19.082
1525.000	17.003
1525.000	17.952
1525.000	19.082
1525.000	22.925
1530.888	17.003
1536.776	15.059
1554.440	19.942
1560.328	16.958
1560.328	17.907
1572.104	19.083
1583.880	17.908
1890.058	14.115
1901.834	16.918
1907.722	16.059
1907.722	18.093
1913.610	15.064
1937.162	16.105
1937.162	16.918
2261.004	18.053
2637.838	16.115
2643.726	16.974
2655.502	17.969
2655.502	19.054
2661.390	15.076
2673.166	16.115
2690.830	16.975
2985.232	16.934
3008.784	17.929
3020.560	15.081
3026.448	19.963
3032.336	15.985
3032.336	17.929
3032.336	19.059
3032.336	19.963
3038.224	21.908
3044.112	16.980
3044.112	20.958
3050.000	15.081
3055.888	17.929
3055.888	19.060
3073.552	21.953
3079.440	17.930
3079.440	19.964
3326.737	19.064
3385.618	24.128
3403.282	17.076
3409.170	22.049
3409.170	19.110
3426.834	17.076
3621.139	21.148
3691.795	19.114
3721.236	18.165
3762.452	19.974
3786.004	19.116
3786.004	21.060
3809.556	17.082
3809.556	17.986
3809.556	19.975
3974.421	19.028
4162.838	15.053
4257.046	19.801];
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39.5);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'CunnSand2011';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
29.440	4.955
41.216	6.899
47.104	9.973
58.880	7.804
58.880	8.753
82.432	13.048
88.320	11.963
200.193	16.847
229.633	15.989
264.961	12.915
353.282	12.917
370.946	14.906
376.834	17.890
382.722	15.946
382.722	18.794
382.722	19.743
382.722	20.738
388.610	16.850
394.498	13.957
630.019	16.989
706.564	19.929
724.228	15.951
759.556	20.970
759.556	22.009
771.332	14.957
771.332	15.906
771.332	18.709
771.332	19.885
989.189	27.935
1012.741	24.861
1507.336	22.834
1513.224	20.981
1542.664	22.835
1548.552	26.090
1907.722	21.981
1931.274	23.971
2272.780	22.936
2655.502	23.936
2679.054	24.841];
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39.5);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'CunnSand2011';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females and males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'slow foetal development is assumed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3FG3N'; % Cat of Life
metaData.links.id_ITIS = '625101'; % ITIS
metaData.links.id_EoL = '129520'; % Ency of Life
metaData.links.id_Wiki = 'Gazella_subgutturosa'; % Wikipedia
metaData.links.id_ADW = 'Gazella_subgutturosa'; % ADW
metaData.links.id_Taxo = '168215'; % Taxonomicon
metaData.links.id_WoRMS = '1537938'; % WoRMS
metaData.links.id_MSW3 = '14200583'; % MSW3
metaData.links.id_AnAge = 'Gazella_subgutturosa'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gazella_subgutturosa}}';
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
bibkey = 'CunnSand2011'; type = 'article'; bib = [ ... 
'author = {P. L. Cunningham and M. A. Sandouka and T. Wronski}, ' ... 
'year = {2011}, ' ...
'title = {Morphological characteristics and ageing criteria of sand gazelle (\emph{Gazella subgutturosa marica} {T}homas, 1897) and their use for wildlife management}, ' ...
'journal = {Eur J Wildl Res}, ' ...
'volume = {57}, '...
'pages = {865-872}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gazella_subgutturosa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

