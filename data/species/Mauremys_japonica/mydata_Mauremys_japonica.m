function [data, auxData, metaData, txtData, weights] = mydata_Mauremys_japonica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Mauremys_japonica'; 
metaData.species_en = 'Japanese pond turtle'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 05];              
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

data.ap = 6*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'iucn';
  temp.ap = C2K(24);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'based on Mauremys reevesii, with which it hybridizes';
data.am = 16.2*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3.5; units.Lb = 'cm';   label.Lb = 'carapace length at birth';             bibkey.Lb = 'Yabe1989';
data.Lp = 11.43;  units.Lp = 'cm';   label.Lp = 'carapace length at puberty for female';  bibkey.Lp = 'guess';
  comment.Lp = 'guess based on same relative length, compared to Emys orbicularis: 12.7/20*18';
data.Lpm = 7;  units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for male';  bibkey.Lpm = 'guess';
  comment.Lpm = 'guess based on same relative length, compared to Emys orbicularis: 12.7/20*11';
data.Li = 18;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';  bibkey.Li = 'Yabe1989';
data.Lim = 11; units.Lim = 'cm';  label.Lim = 'ultimate carapace length for male';   bibkey.Lim = 'Yabe1989';

data.Wwb = 5.65; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Yabe1989';
  comment.Wwb = 'based on (Lb/Li)^3*Wwi and (Lb/Lim)^3*Wwim';
data.Wwi = 750;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';   bibkey.Wwi = 'Yabe1989';
data.Wwim = 180; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'Yabe1989';

data.Ri  = 9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'iucn';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Mauremys reevesii, with which it hybridizes';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time (d), carapace length (cm)
0.000	3.477
0.399	5.239
1.542	5.247
2.600	6.315
3.595	6.725
5.666	12.407
6.590	12.816
7.661	12.824
8.636	14.879
9.626	15.617
10.684	16.722
11.615	16.546
12.618	16.297
13.675	17.402
14.644	17.080
15.618	16.246
16.612	16.802];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'carapace length', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Yabe1989';
comment.tL_f = 'Data for females, temp is guessed';
%
data.tL_m = [ ... % time (d), carapace length (cm)
0.000	3.550
0.435	5.203
1.471	5.174
3.357	8.588
4.429	8.523
5.309	9.589
6.308	9.670
7.371	10.299
8.334	10.452
9.282	11.703
10.331	10.650
11.330	10.767];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'carapace length', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Yabe1989';
comment.tL_m = 'Data for males, temp is guessed';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'This species is known to hybridize with the Chinese pond turtle, the Chinese stripe-necked turtle, and the Chinese box turtle ';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3YFWC'; % Cat of Life
metaData.links.id_ITIS = '551930'; % ITIS
metaData.links.id_EoL = '1055873'; % Ency of Life
metaData.links.id_Wiki = 'Mauremys_japonica'; % Wikipedia
metaData.links.id_ADW = 'Mauremys_japonica'; % ADW
metaData.links.id_Taxo = '48581'; % Taxonomicon
metaData.links.id_WoRMS = '1498266'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Mauremys&species=japonica'; % ReptileDB
metaData.links.id_AnAge = 'Mauremys_japonica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mauremys_japonica}}';
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
bibkey = 'Yabe1989'; type = 'Article'; bib = [ ... 
'author = {T. Yabe}, ' ... 
'year = {1989}, ' ...
'title = {Population Structure and Growth of the {J}apanese Pond Turtle, \emph{Mauremys japonica}}, ' ...
'journal = {Japanese Journal of Herpetology}, ' ...
'volume = {13}, ' ...
'number = {1}, ' ...
'pages = {7-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/170502/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mauremys_japonica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
