function [data, auxData, metaData, txtData, weights] = mydata_Astrochelys_yniphora
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Astrochelys_yniphora'; 
metaData.species_en = 'Angonoka tortoise'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTh', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 25];

%% set data
% zero-variate data

data.ab = 6.5*30.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on Astrochelys radiata, 5 to 8 months';
data.am = 188*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Astrochelys radiata';
  
data.Lb = 4.72; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'SmitPedr2001';
data.Lp = 31; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';   bibkey.Lp = 'SmitPedr2001';
data.Li = 37.01; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';   bibkey.Li = 'Wiki';
data.Lim = 41.48; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';   bibkey.Lim = 'Wiki';

data.Wwp = 4.3e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'SmitPedr2001';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 8.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
data.Wwim = 10.3e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Astrochelys radiata';
  
% uni-variate data

% length - change in length
data.LdL = [ ... % carapace length (cm), relative growth (ln CL_365/CL_0)/365
4.39271	0.14667
4.55519	0.15272
4.72033	0.15071
4.87950	0.16683
4.88215	0.15877
4.88978	0.13558
5.03004	0.20917
5.13350	0.14466
5.37143	0.17137
5.38154	0.14063
5.69109	0.19960
6.04358	0.12802
7.02611	0.14113
7.02794	0.13558
7.19473	0.12853
7.69279	0.11442
8.18008	0.13306
13.20714	0.10081
14.52674	0.08921
15.60195	0.07056
16.75012	0.08014
20.04075	0.07661
22.10463	0.05242
26.79362	0.04788
27.04199	0.04284
27.85541	0.07006
31.07243	0.04032
33.71313	0.01260
36.00996	0.03024
36.42927	0.00554
37.98579	0.02369
38.23682	0.01058
38.48303	0.01210
39.80197	0.00252
41.76968	0.02067
42.51346	0.00958
43.58503	0.00202
45.39424	0.00202
48.10706	0.00504];
data.LdL(:,2) = (data.LdL(:,1) .* exp(data.LdL(:,2)) - data.LdL(:,1)) / 365; % convert to absolute growth
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'carapace length','change in carapace length'};  
temp.LdL    = C2K(24);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'SmitPedr2001';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '5VVSV'; % Cat of Life
metaData.links.id_ITIS = '949443'; % ITIS
metaData.links.id_EoL = '794291'; % Ency of Life
metaData.links.id_Wiki = 'Astrochelys_yniphora'; % Wikipedia
metaData.links.id_ADW = 'Astrochelys_yniphora'; % ADW
metaData.links.id_Taxo = '1685693'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Astrochelys&species=yniphora'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Astrochelys_yniphora}}';
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
bibkey = 'SmitPedr2001'; type = 'Article'; bib = [ ... 
'doi = {10.1080/21564574.2001.9635446}, ' ...
'author = {Lora L. Smith and Miguel Pedrono and Robert M. Dorazio and Jack Bishko}, ' ... 
'year = {2001}, ' ...
'title = {Morphometrics, sexual dimorphism, and growth in the {A}ngonoka tortoise (\emph{Geochelone yniphora}) of western {M}adagascar}, ' ...
'journal = {African Journal of Herpetology}, ' ...
'volume = {50}, ' ...
'number = {1}, ' ...
'pages = {9-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Gopherus_polyphemus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gopherus_polyphemus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ErnsBarb1989'; type = 'Book'; bib = [ ...  
'author = {C. H. Ernst and R. W. Barbour}, ' ...
'year = {1989}, ' ...
'title  = {Turtles of the world}, ' ...
'publisher = {Smithsonian Institutiun Press, Washington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


