function [data, auxData, metaData, txtData, weights] = mydata_Phrynosoma_ditmarsi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Phrynosoma_ditmarsi'; 
metaData.species_en = 'Rock horned lizard'; 

metaData.ecoCode.climate = {'BSk', 'BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 26];

%% set data
% zero-variate data

data.ap = 2*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'Mont1989';
  temp.ap = C2K(25); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.1;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'Mont1989';  
  comment.Lb = 'based on Lpm * (Wwb/Wwpm)^(1/3)';
data.Lp  = 6.7;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'Mont1989';  
data.Lpm  = 5.8;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'Mont1989';  
data.Li  = 7.2;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'Mont1989';  
  comment.Lb = 'based on Lpm * (Wwi/Wwpm)^(1/3)';

data.Wwb = 0.9;   units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'Mont1989';
data.Wwp = 29;   units.Wwp = 'g';  label.Wwp = 'wet at puberty for females'; bibkey.Wwp = 'Mont1989';
data.Wwpm = 19;   units.Wwpm = 'g';  label.Wwpm = 'wet at puberty for males'; bibkey.Wwpm = 'Mont1989';
data.Wwi = 36;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'Mont1989';

data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Mont1989';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-weight
data.tW_fm = [ ... % time since birth (d), weight (g) of female, male
   0  0.69  0.88
  33  2.66  2.63
  66  5.00  5.70
  91  6.53  7.03
 124  5.87 10.25
 153  6.55  9.45
 275  7.24 11.82
 305 10.99 15.42
 334 17.53 21.09
 365 20.48 20.48
 406 28.51 24.82
 448  NaN  21.40
 667 37.59 25.35
 742 31.72 30.30
 766 33.10 30.32];    
units.tW_fm  = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm   = C2K(25);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'Mont1989'; treat.tW_fm = {1 {'females','males'}};
comment.tW_fm = 'overwinter at 15C';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Mont1989'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GWSP'; % Cat of Life
metaData.links.id_ITIS = '585964'; % ITIS
metaData.links.id_EoL = '791087'; % Ency of Life
metaData.links.id_Wiki = 'Phrynosoma_ditmarsi'; % Wikipedia
metaData.links.id_ADW = 'Phrynosoma_ditmarsi'; % ADW
metaData.links.id_Taxo = '524515'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Phrynosoma&species=ditmarsi'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phrynosoma_ditmarsi}}';
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
bibkey = 'Mont1989'; type = 'Article'; bib = [ ... 
'author = {R. R. Montanucci}, ' ... 
'year = {1989}, ' ...
'title = {The reproduction and growth of \emph{Phrynosoma ditmarsi} ({S}auria: {I}guanidae) in captivity}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {8}, ' ...
'pages = {139--149}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

