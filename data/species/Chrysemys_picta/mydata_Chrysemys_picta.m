function [data, auxData, metaData, txtData, weights] = mydata_Chrysemys_picta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Chrysemys_picta'; 
metaData.species_en = 'Painted turtle';

metaData.ecoCode.climate = {'Cfb','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am';'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

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

data.ab = 76;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '72-80 d';
data.tp = 8*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '6-10 yr';
data.tpm = 3*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(20);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tp = '2-4 yr';
data.am = 61*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li = 25; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = {'ADW','Wiki'};
data.Lim = 15; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = {'ADW','Wiki'};

data.Wwb = 3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Rowe1994';

data.Ri  = 4*6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8(north)-4.5(south) eggs per clutch, 1 (north)-5(south) clutches per yr';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
1.045	3.440
1.999	5.365
2.864	7.965
3.988	9.270
4.919	10.790
5.830	11.769
6.850	12.695
7.905	12.918
8.880	13.006];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Wilb1975';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
0.959	3.844
1.995	5.770
2.921	7.723
3.938	8.865
5.040	9.710
5.957	10.176
7.013	10.345
8.039	10.703
9.065	11.088];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Wilb1975';
comment.tL_m = 'Data for males; temp is guessed';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
0.859	18.559
1.856	45.717
2.921	99.312
3.883	162.151
4.983	240.197
5.945	304.358
7.045	332.184
8.007	352.071
9.072	362.714];
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % convert yr to d
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(20);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Wilb1975';
comment.tWw_f = 'Data for females; temp is guessed';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
0.928	10.634
1.959	40.438
2.955	92.046
4.021	140.354
4.948	166.186
6.048	178.814
7.079	195.402
8.041	200.752
9.038	208.086];
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % convert yr to d
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(20);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Wilb1975';
comment.tWw_m = 'Data for males; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

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
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'age at puberty is ignored because it is incosistent with Lp combined with tL data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Temperatures < 22 C give males > 27 C females';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YKRV'; % Cat of Life
metaData.links.id_ITIS = '173783'; % ITIS
metaData.links.id_EoL = '795380'; % Ency of Life
metaData.links.id_Wiki = 'Chrysemys_picta'; % Wikipedia
metaData.links.id_ADW = 'Chrysemys_picta'; % ADW
metaData.links.id_Taxo = '48600'; % Taxonomicon
metaData.links.id_WoRMS = '1314186'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Chrysemys&species=picta'; % ReptileDB
metaData.links.id_AnAge = 'Chrysemys_picta'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chrysemys_picta}}';
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
bibkey = 'Wilb1975'; type = 'Article'; bib = [ ... 
'author = {Henry M. Wilbur}, ' ... 
'year = {1975}, ' ...
'title = {A Growth Model for the Turtle \emph{Chrysemys picta}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1975(2)}, ' ...
'pages = {78-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rowe1994'; type = 'Article'; bib = [ ... 
'author = {John W. Rowe}, ' ... 
'year = {1994}, ' ...
'title = {Reproductive variation and the egg size-clutch size trade-off within and among populations of painted turtles (\emph{Chrysemys picta bellii})}, ' ...
'journal = {Oecologia}, ' ...
'volume = {99}, ' ...
'pages = {35-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chrysemys_picta}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/795380}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Chrysemys_picta/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

