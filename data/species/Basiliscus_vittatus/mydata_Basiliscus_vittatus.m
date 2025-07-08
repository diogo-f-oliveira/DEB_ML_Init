function [data, auxData, metaData, txtData, weights] = mydata_Basiliscus_vittatus

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Teiidae';
metaData.species    = 'Basiliscus_vittatus';
metaData.species_en = 'Four-lined whiptail';

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 08];

%% set data
% zero-variate data;
data.ab = 60;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'AnAge';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 228;     units.tp = 'd'; label.tp = 'time since irth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9.1*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'AnAge';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 3.6;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Hirt1963';
data.Lp  = 9.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Hirt1963';
data.Lpm  = 9.0;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'Hirt1963';
data.Li  = 11.7;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Hirt1963';
data.Lim  = 12;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Hirt1963';
 
data.Wwb  = 3.66;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwi = 'based on Basiliscus_plumifrons: (3.6/13.5)^3*193';
data.Wwi  = 126;   units.Wwi  = 'g';  label.Wwi  = 'ultimate weight for females';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on Basiliscus_plumifrons: (11.7/13.5)^3*193';

data.Ri  = 4.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Hirt1963';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% length-change in length
data.LdL_f = [ ... % SVL (cm),  change in SVL (cm) per 15 d
  3.75 0.75
  4.5  0.63
  5.5  0.50
  6.5  0.29
  7.5  0.27
 10.5  0.03];
data.LdL_f(:,2) = data.LdL_f(:,2)/15; % convert to cm/d  per 15 d
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'females'};  
temp.LdL_f   = C2K(25);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'Hirt1963';
%
data.LdL_m = [ ... % SVL (cm),  change in SVL (cm)
  5.5 0.51
  6.5 0.39
  7.5 0.25
 10.5 0.02
 11.5 0.01];
data.LdL_m(:,2) = data.LdL_m(:,2)/15; % convert to cm/d
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'males'};  
temp.LdL_m   = C2K(25);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'Hirt1963';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 3 * weights.Lb;
weights.Li = 3 * weights.Li;
weights.Lp = 5 * weights.Lp;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '68CY8'; % Cat of Life
metaData.links.id_ITIS = '173908'; % ITIS
metaData.links.id_EoL = '795608'; % Ency of Life
metaData.links.id_Wiki = 'Basiliscus_vittatus'; % Wikipedia
metaData.links.id_ADW = 'Basiliscus_vittatus'; % ADW
metaData.links.id_Taxo = '49097'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Basiliscus&species=vittatus'; % ReptileDB
metaData.links.id_AnAge = 'Basiliscus_vittatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Basiliscus_vittatus}}';   
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
bibkey = 'Hirt1963'; type = 'Article'; bib = [ ...
'doi = {10.2307/1948557}, ' ...
'author = {Hirth, H. F.}, ' ...
'title = {The Ecology of Two Lizards on a Tropical Beach}, ' ...
'journal = {Ecological Monographs}, ' ...
'volume = {33(2)}, ' ...
'pages = {83–112}, ' ...
'year = {1963}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Basiliscus_vittatus}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
