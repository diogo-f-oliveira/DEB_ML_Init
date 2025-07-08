function [data, auxData, metaData, txtData, weights] = mydata_Pelusios_subniger
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Pelomedusidae';
metaData.species    = 'Pelusios_subniger'; 
metaData.species_en = 'East African black mud turtle';

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 02];              
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

data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Gerl2008';
  temp.tp = C2K(30);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 47*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnGae';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'Gerl2008';
data.Li = 15; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Gerl2008';

data.Wwi = 1233; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EoL';

data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on weight-corrected value for Podocnemis_unifilis: 40 * 1233/11600';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
0.000	2.972
0.043	3.336
0.088	3.700
0.100	3.733
0.132	3.964
0.164	4.030
0.189	4.196
0.202	4.328
0.202	4.229
0.233	4.328
0.271	4.824
0.271	4.625
0.303	5.187
0.303	4.956
0.328	5.484
0.373	5.518
0.385	6.046
0.385	5.716
0.411	5.749
0.436	5.980
0.442	5.782
0.461	6.113
0.474	6.278
0.493	6.542
0.512	6.542
0.550	7.137
0.993	10.475
1.107	11.004
1.342	11.468
2.053	12.397
3.538	14.023
5.874	14.862];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(30);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Gerl2008';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
0.474	6.245
0.544	6.741
1.000	9.451
1.355	10.114
2.047	11.340
2.993	12.204];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(30);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Gerl2008';
comment.tL_m = 'Data for males; temp is guessed';

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
D2 = 'age at puberty is ignored because it is incosistent with Lp combined with tL data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '76FP5'; % Cat of Life
metaData.links.id_ITIS = '551831'; % ITIS
metaData.links.id_EoL = '791166'; % Ency of Life
metaData.links.id_Wiki = 'Pelusios_subniger'; % Wikipedia
metaData.links.id_ADW = 'Pelusios_subniger'; % ADW
metaData.links.id_Taxo = '48218'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pelusios&species=subniger'; % ReptileDB
metaData.links.id_AnAge = 'Pelusios_subniger'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelusios_subniger}}';
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
bibkey = 'Gerl2008'; type = 'Article'; bib = [ ... 
'author = {Justin Gerlach}, ' ... 
'year = {2008}, ' ...
'title = {Fragmentation and Demography as Causes of Population Decline in {S}eychelles Freshwater Turtles (Genus \emph{Pelusios})}, ' ...
'journal = {Chelonian Conservation and Biology}, ' ...
'volume = {7(1)}, ' ...
'pages = {78-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pelusios_subniger}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791166}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

