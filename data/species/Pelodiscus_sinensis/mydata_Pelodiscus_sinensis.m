function [data, auxData, metaData, txtData, weights] = mydata_Pelodiscus_sinensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Trionychidae';
metaData.species    = 'Pelodiscus_sinensis'; 
metaData.species_en = 'Chinese softshell turtle';

metaData.ecoCode.climate = {'Cfa', 'Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'T-ab'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 31];              
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

data.am = 50*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'Wiki';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Apalone spinifera';

data.Lp = 18.5; units.Lp = 'cm';   label.Lp = 'carapace length at puberty for female';   bibkey.Lp = 'Wiki';
data.Lpm = 15; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for male';   bibkey.Lpm = 'guess';
data.Li = 33; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';      bibkey.Li = 'Wiki';
data.Lim = 27; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'Wiki';

data.Wwb = 4.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'JiChen2003';
data.Wwi = 2246; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EoL';

data.Ri  = 19*3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 to 30 eggs per clutch, 2 to 5 clutches per yr';
  
% uni-variate data

% time-weight
data.tW_f = [ ... % ln time since birth (d), ln weight (g)
3.817	3.233
4.258	4.056
4.521	4.372
4.911	4.969
5.127	5.278
5.385	5.690
5.627	5.999];
data.tW_f = exp(data.tW_f); % remove log-transformation
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(30);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'JiChen2003';
comment.tW_f = 'Data for females; given that males are smaller than females, the sex markers in Fig 3 of JiChen2003 are assumed to have been interchanged';
%
data.tW_m = [ ... % ln time since birth (d), ln weight (g)
3.762	3.164
4.254	3.837
4.509	4.099
4.916	4.621
5.119	4.739
5.374	5.068
5.624	5.453];
data.tW_m = exp(data.tW_m); % remove log-transformation
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(30);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'JiChen2003';
comment.tW_m = 'Data for males; given that males are smaller than females, the sex markers in Fig 3 of JiChen2003 are assumed to have been interchanged';


% T-ab data
data.Tab = [ ... % temperature (C), incubation time (d)
24 88.7
24 84.0
28 52.8
28 51.0
30 47.4
30 44.0
34 39.4
34 37.0];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'incubation time'};  
bibkey.Tab = 'JiChen2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f;
weights.tW_m = 2 * weights.tW_m;
weights.Tab = 5 * weights.Tab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Sex is determined by genetics';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76CTF'; % Cat of Life
metaData.links.id_ITIS = '208697'; % ITIS
metaData.links.id_EoL = '791178'; % Ency of Life
metaData.links.id_Wiki = 'Pelodiscus_sinensis'; % Wikipedia
metaData.links.id_ADW = 'Pelodiscus_sinensis'; % ADW
metaData.links.id_Taxo = '48432'; % Taxonomicon
metaData.links.id_WoRMS = '1026091'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pelodiscus&species=sinensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelodiscus_sinensis}}';
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
bibkey = 'JiChen2003'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0952836903004266}, ' ...
'author = {X. Ji and F. Chen and W.-G. Du and H.-L. Chen}, ' ... 
'year = {2003}, ' ...
'title = {Incubation temperature affects hatchling growth but not sexual phenotype in the {C}hinese soft-shelled turtle, \emph{Pelodiscus sinensis} ({T}rionychidae)}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {261}, ' ...
'pages = {409-416}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/791178/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

