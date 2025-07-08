function [data, auxData, metaData, txtData, weights] = mydata_Myuchelys_bellii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Myuchelys_bellii'; 
metaData.species_en = 'Namoi River snapping turtle';

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 08];              
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

data.ab = 50;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'FielLimp2015';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '49-51 d';
data.tp = 10.7*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'FielLimp2015';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 6*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'FielLimp2015';
  temp.tpm = C2K(18);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.67; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'FielLimp2015';
data.Lp = 21.6; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'FielLimp2015';
data.Lpm = 17.5; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';      bibkey.Lpm = 'FielLimp2015';
data.Li = 30; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'FielLimp2015';
data.Lim = 21.9; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'FielLimp2015';

data.Ww0 = 8.6; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';   bibkey.Ww0 = 'FielLimp2015';
data.Wwi = 3.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'FielLimp2015';
  comment.Wwi = 'based on CL 24.6 corresponds with 1785 g: (30/24.7)^3*1785';

data.Ri  = 18.7/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at CL 24.6';   bibkey.Ri  = 'FielLimp2015';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
1.952	10.321
2.049	9.206
2.122	7.199
2.811	7.759
2.811	8.038
2.886	9.934
3.060	11.830
3.061	13.057
3.086	13.838
3.109	11.050
3.700	11.609
3.751	14.174
3.872	12.111
4.096	15.123
4.096	15.681
4.241	12.279
4.757	10.720
4.954	11.501
5.101	10.274
5.101	11.278
5.104	14.178
5.105	15.962
5.129	15.126
6.068	19.868
6.085	10.835
6.087	12.563
6.089	15.965
6.090	16.523
6.115	17.136
6.777	14.573
6.778	15.632
7.003	20.373
7.025	16.637
7.076	19.704
7.196	15.187
7.811	15.356
8.009	16.416
8.105	14.577
8.110	20.264
8.206	17.421
8.825	21.828
8.844	15.080
9.268	21.829
9.732	18.707
9.779	15.139
10.025	15.586
10.227	21.999
10.715	16.926
10.766	18.599
10.766	19.101
10.813	16.313
10.888	18.488
11.137	21.890
11.949	21.781
12.216	16.986
15.808	17.832];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FielLimp2015';
comment.tL_f = 'Data for females from Darling River';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
2.690	9.989
2.789	11.049
3.083	10.213
3.159	12.276
3.748	11.163
4.094	12.335
7.049	16.135
7.172	15.856
8.134	18.926
9.756	17.146
10.788	16.536
11.798	17.486];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FielLimp2015';
comment.tL_m = 'Data for males from Darling River';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '45GT4'; % Cat of Life
metaData.links.id_ITIS = '949508'; % ITIS
metaData.links.id_EoL = '4522311'; % Ency of Life
metaData.links.id_Wiki = 'Myuchelys_bellii'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4204496'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Myuchelys&species=bellii'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myuchelys_bellii}}';
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
bibkey = 'FielLimp2015'; type = 'Article'; bib = [ ... 
'doi = {10.1071/ZO14070}, ' ...
'author = {Darren P. Fielder and Duncan J. Limpus and Colin J. Limpus}, ' ... 
'year = {2015}, ' ...
'title = {Reproduction and population ecology of the vulnerable western sawshelled turtle, \emph{Myuchelys bellii}, in the {M}urray-{D}arling {B}asin, {A}ustralia}, ' ...
'journal = {Australian Journal of Zoology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/4522311}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

