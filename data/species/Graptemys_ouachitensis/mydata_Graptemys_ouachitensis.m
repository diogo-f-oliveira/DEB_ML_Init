function [data, auxData, metaData, txtData, weights] = mydata_Graptemys_ouachitensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Graptemys_ouachitensis'; 
metaData.species_en = 'Ouachita map turtle';

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl','biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 06];              
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

data.ab = 76;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(31);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 31*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.5; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Lind1999';
data.Lp = 15.5; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'theturtleroom';
data.Lpm = 7; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';      bibkey.Lpm = 'theturtleroom';
data.Li = 25; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Wiki';
data.Lim = 12; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'Wiki';

data.Wwi = 2763; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EoL';
 
data.Ri = 4*13/365;     units.Ri = '#/d';    label.Ri = 'maximum reproduction rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
0.248	4.168
0.249	4.924
0.278	4.622
0.307	4.924
0.365	4.924
0.366	5.429
0.394	5.277
0.408	4.370
0.422	4.672
0.480	4.773
0.494	4.067
0.510	5.630
0.655	5.782
1.321	6.588
1.322	7.092
1.365	7.092
1.380	7.345
1.408	6.387
1.409	7.496
1.481	7.042
1.857	6.941
1.857	7.496
2.002	7.496
2.451	8.353
3.392	9.664
3.436	10.218
3.568	11.681
3.869	9.664
4.408	12.387];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to ddata.tL_f(:,2) = data.tL_f(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lind1999';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
2.467	9.311];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lind1999';
comment.tL_m = 'Data for males; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Temperatures < 28 C give males, >30 C females';
metaData.bibkey.F1 = '';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6L57B'; % Cat of Life
metaData.links.id_ITIS = '173799'; % ITIS
metaData.links.id_EoL = '456491'; % Ency of Life
metaData.links.id_Wiki = 'Graptemys_ouachitensis'; % Wikipedia
metaData.links.id_ADW = 'Graptemys_ouachitensis'; % ADW
metaData.links.id_Taxo = '399213'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Graptemys&species=ouachitensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Graptemys_ouachitensis}}';
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
bibkey = 'Lind1999'; type = 'Article'; bib = [ ... 
'author = {Peter V. Lindeman}, ' ... 
'year = {1999}, ' ...
'title = {Growth Curves for \emph{Graptemys}, with a Comparison to Other Emydid Turtles}, ' ...
'journal = {Am. Midl. Nat.} , ' ...
'volume = {142}, ' ...
'pages = {141-151}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/456491}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'theturtleroom'; type = 'Misc'; bib = ...
'howpublished = {\url{https://theturtleroom.org/species-profiles/graptemys-ouachitensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

