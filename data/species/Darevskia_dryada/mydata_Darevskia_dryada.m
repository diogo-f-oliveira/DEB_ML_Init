function [data, auxData, metaData, txtData, weights] = mydata_Darevskia_dryada

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Darevskia_dryada'; 
metaData.species_en = 'Charnali lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.3); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 13];

%% set data
% zero-variate data

data.tp = 1.5*365;     units.tp = 'd';    label.tp = 'age at puberty';  bibkey.tp = 'AltuEksi2018';
  temp.tp = C2K(12.3); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AltuEksi2018';   
  temp.am = C2K(12.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.76;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'AltuEksi2018';
  comment.Lb = 'guessed by authors on the basis of D. clarkorum';
data.Lp  = 4.57;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';         bibkey.Lp  = 'AltuEksi2018';  
data.Li  = 7.4;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'guess';  
data.Lim  = 7.2;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';         bibkey.Lim  = 'guess';  

data.Wwi = 9.33;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(12.3);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lacerta strigata, temp corrected';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm): females, males
3   NaN   4.632
3   NaN   5.451
4	5.016 4.757
4	4.533 NaN
5	5.228 5.529
5	4.817 6.479
5	6.867 4.991
5	5.307 NaN
6	6.623 6.035
6	5.715 NaN
6	5.154 NaN
6	5.356 NaN
6	4.978 NaN
7	5.608 6.152
7	6.111 5.591
7	5.706 7.134
7	5.569 6.487
8	6.010 6.643
9	6.791 6.635];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(12.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AltuEksi2018'; treat.tL = {1, {'females','males',}};
comment.tL = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3462R'; % Cat of Life
metaData.links.id_ITIS = '1155327'; % ITIS
metaData.links.id_EoL = '1056203'; % Ency of Life
metaData.links.id_Wiki = 'Darevskia_dryada'; % Wikipedia
metaData.links.id_ADW = 'Darevskia_dryada'; % ADW
metaData.links.id_Taxo = '1685256'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Darevskia&species=dryada'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Darevskia_dryada}}';
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
bibkey = 'AltuEksi2018'; type = 'Article'; bib = [ ... 
'doi = {10.1163/15707563-17000092}, ' ...
'author = {Abdullah Altun{\i}\c{s}s{\i}k and Halit Eksilmez}, ' ... 
'year = {2018}, ' ...
'title = {Demographic life history traits in a population of a critically endangered species, \emph{Darevskia dryada} ({D}arevsky \& {T}uniyev, 1997)}, ' ...
'journal = {Animal Biology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1056203}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
