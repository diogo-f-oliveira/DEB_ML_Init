function [data, auxData, metaData, txtData, weights] = mydata_Siphonops_annulatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Gymnophiona'; 
metaData.family     = 'Siphonopidae';
metaData.species    = 'Siphonops_annulatus'; 
metaData.species_en = 'Ringed caecilian'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bjTva', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 20];


%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on other caecilian as given in AnAge';

data.Lb  = 4.5;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'JareMail2018';  
data.Lj  = 15;     units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'KupfKram2004';  
  comment.Lp = 'value for Ichthyophis_kohtaoensis';
data.Lp  = 20;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'KupfKram2004';
  comment.Lp = 'value for Ichthyophis_kohtaoensis';
data.Li  = 48;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li  = 'Wiki';

data.Wwb = 0.22;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'JareMail2018';
data.Wwj = 3.6;     units.Wwj = 'g';   label.Wwj = 'wet weight at metam';      bibkey.Wwj = 'guess';
  comment.Wwj = 'based on Wwi*(L_j/L_m)^3';
data.Wwp = 8.4;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwi*(L_p/L_m)^3';
data.Wwi = 116.35;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'guess';

data.Ri  = 16/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'JareMail2018';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 16 eggs per brood';

% uni-variate data

% time - length
data.tL = [ ... % time since birth (d), length (cm)
0	4.50
8	6.50
15	8.00
23	9.00
31	10.43
39	11.74
47	12.29
62	12.33
77	13.76
94	15.35
124	17.51
140	18.26
161	19.40]; 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JareMail2018';

% time - weight
data.tW = [ ... % ftime since birth (d), weight (g)
0	0.22
8	0.49
15	0.83
23	1.15
31	1.59
39	2.00
47	2.31
62	2.40
77	3.13
94	4.09
124	5.63
140	6.63
161	7.11]; 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(27);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'JareMail2018';

% length-weight
data.LW = [data.tL(:,2), data.tW(:,2)];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'JareMail2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.tW = 3 * weights.tW;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Neonates feed on the skin of the mother: dermatophagy';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XQC7'; % Cat of Life
metaData.links.id_ITIS = '668505'; % ITIS
metaData.links.id_EoL = '320007'; % Ency of Life
metaData.links.id_Wiki = 'Siphonops_annulatus'; % Wikipedia
metaData.links.id_ADW = 'Siphonops_annulatus'; % ADW
metaData.links.id_Taxo = '48023'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Siphonops+annulatus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siphonops_annulatus}}';
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
bibkey = 'JareMail2018'; type = 'Article'; bib = [ ...
'doi = {10.1111/azo.12254}, ' ...
'author = {Carlos Jared and Pedro Luiz Mailho-Fontana and Simone G. S. Jared and Alexander Kupfer and Jacques Hubert Charles Delabie and Mark Wilkinson and Marta Maria Antoniazzi}, ' ... 
'year = {2018}, ' ...
'title = {Life history and reproduction of the neotropical caecilian \emph{Siphonops annulatus} ({A}mphibia, {G}ymnophiona, {S}iphonopidae), with special emphasis on parental care}, ' ...
'journal = {Acta Zoologica}, ' ...
'volume = {2018}, ' ...
'pages = {1-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KupfKram2004'; type = 'Article'; bib = [ ... 
'author = {Kupfer, A. and Kramer, A. and Himstedt, W.}, ' ... 
'year = {2004}, ' ...
'title = {Sex-related growth patterns in a caecilian amphibian (genus \emph{Ichthyophis}): evidence from laboratory data}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {262}, ' ...
'pages = {173--178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
