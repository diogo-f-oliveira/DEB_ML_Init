function [data, auxData, metaData, txtData, weights] = mydata_Actinemys_marmorata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Actinemys_marmorata'; 
metaData.species_en = 'Western pond turtle'; 

metaData.ecoCode.climate = {'Csa', 'Csb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 11];              
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

data.am = 80*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';   bibkey.Lp  = 'GermRied2015'; 
data.Li  = 14.8;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'GermRied2015';
data.Lim  = 16;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'GermRied2015';

data.Wwb = 5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
data.Wwi = 563; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'GermRied2015';
data.Wwim = 626; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'GermRied2015';

data.Ri  = 1.5*6.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'GermRied2015';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6.3 eggs per clutch, 1.5 clutch per yr';
 
% uni-variate data

% time-length data
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
0.003	2.530
0.003	2.906
1.011	5.470
1.102	5.026
1.195	6.598
1.241	7.009
1.403	8.718
1.423	6.701
1.423	6.906
1.561	7.658
1.606	7.179
1.630	8.103
1.745	8.718
1.996	8.855
1.997	9.162
2.018	7.692
2.018	7.966
2.040	7.453
2.110	8.103
2.131	6.803
2.155	7.726
2.202	8.684
2.202	9.060
2.249	10.017
2.269	7.453
2.271	9.846
2.406	8.034
2.431	9.265
2.453	8.752
2.474	7.179
2.477	10.256
2.634	7.829
2.637	9.778
2.705	9.402
2.727	8.752
2.728	9.983
2.772	8.274
3.004	11.145
3.027	11.385
3.229	8.923
4.008	10.974
4.008	11.214
4.055	11.897
4.055	12.239
4.078	12.547
4.099	10.325
4.122	11.214
4.213	10.940
4.213	11.009
4.214	11.453
4.237	11.692
4.396	11.350
4.397	11.419
4.421	12.479
4.421	12.718
4.465	11.726
4.487	10.940
4.488	11.521
4.604	13.299
4.627	13.060
4.763	12.444
4.764	13.333
5.014	12.342
5.014	12.718
5.084	13.538
5.106	13.299
5.196	11.761
5.219	12.068
5.266	12.991
5.266	13.402
5.379	12.274
5.403	12.855
5.403	13.265
5.495	13.402
5.586	13.573
5.609	13.094
6.067	14.462
6.180	13.812
6.249	14.530
7.117	14.701
8.075	13.368
8.076	14.906
8.305	15.145
9.058	15.111
9.241	15.419
9.242	15.658
10.085	14.872
10.107	14.154
10.245	14.393
11.068	15.487
11.706	14.803
12.391	14.359];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GermRied2015';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
2.524	10.838
4.056	13.162
4.261	12.444
4.947	13.915
5.199	13.983
6.022	15.385
6.043	14.017
6.249	14.154
6.432	14.667
7.986	15.350
8.031	14.838
8.214	15.590
9.036	15.350
9.059	16.034
9.105	16.171
9.129	16.855
9.241	15.111
9.470	15.350
9.995	15.761
10.042	16.479
10.042	16.718
10.087	16.034
11.000	15.761
11.025	17.538
11.047	17.094
11.093	17.197
11.274	15.863
11.296	15.487
12.075	17.504
12.096	15.897
12.118	15.487
13.031	15.624
13.079	16.855
13.101	16.103
13.214	15.350
14.083	17.094
14.106	16.684
14.265	15.932];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GermRied2015';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '9T2V'; % Cat of Life
metaData.links.id_ITIS = '668668'; % ITIS
metaData.links.id_EoL = '47364908'; % Ency of Life
metaData.links.id_Wiki = 'Actinemys_marmorata'; % Wikipedia
metaData.links.id_ADW = 'Actinemys_marmorata'; % ADW
metaData.links.id_Taxo = '725737'; % Taxonomicon
metaData.links.id_WoRMS = '1491018'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Actinemys&species=marmorata'; % ReptileDB
metaData.links.id_AnAge = 'Actinemys_marmorata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Actinemys_marmorata}}';
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
bibkey = 'GermRied2015'; type = 'Article'; bib = [ ... 
'author = {David J. Germano and J. Daren Riedle}, ' ... 
'year = {2015}, ' ...
'title = {Population Structure, Growth, Survivorship, and Reproduction of \emph{Actinemys marmorata} from a High Elevation Site in the {T}ehachapi {M}ountains, {C}alifornia}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {71}, ' ...
'number = {2}, ' ...
'pages = {102-109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Actinemys_marmorata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Actinemys_marmorata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

