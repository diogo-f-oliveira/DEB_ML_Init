function [data, auxData, metaData, txtData, weights] = mydata_Pan_troglodytes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Hominidae';
metaData.species    = 'Pan_troglodytes'; 
metaData.species_en = 'Common chimpanzee'; 

metaData.ecoCode.climate = {'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2021 12 28];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 28]; 

%% set data
% zero-variate data

data.tg = 229;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 1111;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3376;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'female; 2920 d for male';
data.am = 59.4*365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 78;    units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'ADW';
  comment.Li = '63.5-92.5 cm';

data.Wwb = 1821;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 44984; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/840; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
0.305	2090.588
0.579	4599.301
0.608	2508.712
0.913	4599.301
1.218	7108.013
1.308	4599.301
1.340	8153.311
1.674	7944.253
1.675	9407.668
1.764	5853.657
1.826	9616.726
1.917	7526.129
2.131	11080.140
2.160	8780.485
2.162	12543.554
2.343	9407.668
2.496	13379.794
2.526	11289.198
2.768	10452.958
2.891	12961.670
2.951	11289.198
3.104	14425.084
3.196	16933.797
3.255	12543.554
3.319	18606.269
3.378	15052.267
3.500	16933.797
3.589	12961.670
3.681	15470.383
3.714	19233.451
3.743	17142.855
3.772	14006.968
3.956	18188.153
4.261	20487.808
4.261	21742.164
4.564	20487.808
4.628	25505.224
4.777	20069.683
4.897	17142.855
4.897	17979.095
4.960	21324.039
5.082	23832.752
5.325	24459.930
5.538	24668.988
5.870	20278.750
6.179	30940.765
6.663	28432.057
7.305	37212.542
7.668	34703.834
8.365	31149.827
8.579	34912.892
9.339	35749.128
9.705	38885.019
11.043	43693.381
12.013	40766.553
12.955	41393.731
12.956	43693.381
13.931	52055.751
13.954	36585.368
13.958	45365.854
13.987	42020.905
15.018	39721.255
15.746	37630.662
15.750	45783.974
16.748	39094.077];
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % convert yr to d
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f   = C2K(35.7);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'HamaUdon1996';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
0.066	3591.544
0.370	2746.479
0.587	5492.958
0.707	3802.819
1.045	5492.958
1.072	3802.819
1.293	8450.704
1.318	4647.885
1.561	4647.885
1.565	6760.565
1.779	7183.097
1.781	8873.236
1.933	8450.704
2.178	9295.777
2.211	10774.650
2.305	12887.322
2.327	7183.097
2.484	10352.109
2.518	12253.523
2.697	9718.310
2.792	12253.523
3.008	13732.396
3.033	10563.376
3.162	15211.268
3.407	15845.067
3.432	12253.523
3.808	19225.354
4.019	17323.940
4.144	19436.620
4.357	19014.088
4.361	21760.567
4.631	19014.088
4.667	22394.366
4.726	21549.292
4.851	23661.968
5.120	20281.686
5.186	23239.440
5.332	18802.813
5.435	26619.718
5.549	21760.567
5.558	27676.054
5.586	25774.644
6.105	26619.718
6.683	25563.378
6.966	31478.873
6.987	25140.841
7.817	29788.729
8.062	30422.533
8.084	44999.998
8.561	38028.167
8.829	34225.352
9.039	51760.563
9.171	38450.704
9.769	51126.759
10.695	58732.392
12.888	57887.324
13.939	47323.940
13.981	54718.308
15.807	53028.169
16.552	62535.209
18.573	48591.547
18.578	51971.829];
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % convert yr to d
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m   = C2K(35.7);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'HamaUdon1996';
comment.tWw_m = 'Data for males';
   
%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4C92G'; % Cat of Life
metaData.links.id_ITIS = '573082'; % ITIS
metaData.links.id_EoL = '326449'; % Ency of Life
metaData.links.id_Wiki = 'Pan_troglodytes'; % Wikipedia
metaData.links.id_ADW = 'Pan_troglodytes'; % ADW
metaData.links.id_Taxo = '66219'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100798'; % MSW3
metaData.links.id_AnAge = 'Pan_troglodytes'; % AnAge

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_2: tWw data added, Wwx removed; {p_Am} makes as jump up at puberty in males';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pan_troglodytes}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pan_troglodytes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Pan_troglodytes/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HamaUdon1996'; type = 'Article'; bib = [ ... 
'author = {Yuzuru Hamada and Toshifumi Udono and Migaku Teramoto and Tsutomu Sugawara}, ' ... 
'year = {1996}, ' ...
'title = {The Growth Pattern of Chimpanzees: {S}omatic Growth and Reproductive Maturation in \emph{Pan troglodytes}}, ' ...
'journal = {Primates}, ' ...
'volume = {37(3)}, ' ...
'pages = {279-295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

