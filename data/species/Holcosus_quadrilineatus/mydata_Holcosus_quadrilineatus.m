function [data, auxData, metaData, txtData, weights] = mydata_Holcosus_quadrilineatus

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Teiidae';
metaData.species    = 'Holcosus_quadrilineatus';
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
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'};

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
data.ab = 55;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'guess';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on values for other Aspidoscelis species';

data.Lb  = 3.4;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Hirt1963';
data.Lp  = 4.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Hirt1963';
data.Lpm  = 5.8;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'Hirt1963';
data.Li  = 7.8;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Hirt1963';
data.Lim  = 7.9;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Hirt1963';
 
data.Wwb  = 0.67;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwi = 'based on Aspidoscelis_sexlineatus: (3.4/8.1)^3*9.1';
data.Wwi  = 8.13;   units.Wwi  = 'g';  label.Wwi  = 'ultimate weight for females';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on Aspidoscelis_sexlineatus: (7.9/8.1)^3*9.1';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Hirt1963';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% length-change in length
data.LdL_f = [ ... % SVL (cm),  change in SVL (cm) in  15 d
    3.8 0.60
    4.5 0.28 
    5.5 0.10
    6.5 0.06];
data.LdL_f(:,2) = data.LdL_f(:,2)/15; % convert to cm/d
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'females'};  
temp.LdL_f   = C2K(25);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'Hirt1963';
%
data.LdL_m = [ ... % SVL (cm),  change in SVL (cm) in 17 d
    4.5 0.37
    5.5 0.15
    6.5 0.12];
data.LdL_m(:,2) = data.LdL_m(:,2)/15; % convert to cm/d
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'males'};  
temp.LdL_m   = C2K(25);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'Hirt1963';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3M7X5'; % Cat of Life
metaData.links.id_ITIS = '1172288'; % ITIS
metaData.links.id_EoL = '1057182'; % Ency of Life
metaData.links.id_Wiki = 'Holcosus_quadrilineatus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4683711'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Holcosus&species=quadrilineatus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Holcosus_quadrilineatus}}';   
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
