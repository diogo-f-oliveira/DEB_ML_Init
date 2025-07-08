function [data, auxData, metaData, txtData, weights] = mydata_Atherinomorus_lacunosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinidae';
metaData.species    = 'Atherinomorus_lacunosus'; 
metaData.species_en = 'Hardyhead silverside'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIN', 'MPSW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 22];

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Cona1988'; 
data.Li  = 25;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'DulcGrub2008';
  comment.Wwb = 'based on egg diameter of 1.75 mm: pi/6*0.175^3';
data.Wwp = 7.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00759*Lp^3.16, see F1';
data.Wwi = 198.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.16, see F1';
 
% uni-variate data
% time-length
data.tL = [ ... time since birth (yr), length (cm)
0.124	3.744
0.200	5.040
0.287	5.719
0.359	6.775
0.461	7.912
0.536	8.591
0.623	9.070
0.707	9.152
0.794	10.050
0.961	10.273
1.126	10.376
1.343	11.337
1.508	11.918];
data.tL(:,1) = (data.tL(:,1) + 0.2) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Cona1988'; 

% length-fecundity
data.LN = [ ... % totallength (cm), fecundity (#)
9.880	1146.993
10.920	737.194
11.001	795.100
11.110	737.194
11.856	959.911
12.079	1570.156
12.275	1106.904
12.364	1583.519
12.735	1356.347
14.901	3124.722];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'}; 
temp.LN    = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Cona1988'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '67WY2'; % Cat of Life
metaData.links.id_ITIS = '166010'; % ITIS
metaData.links.id_EoL = '63619961'; % Ency of Life
metaData.links.id_Wiki = 'Atherinomorus_lacunosus'; % Wikipedia
metaData.links.id_ADW = 'Atherinomorus_lacunosus'; % ADW
metaData.links.id_Taxo = '94364'; % Taxonomicon
metaData.links.id_WoRMS = '126331'; % WoRMS166010
metaData.links.id_fishbase = 'Atherinomorus-lacunosus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Atherinomorus_lacunosus}}'];
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
bibkey = 'Cona1988'; type = 'PhDthesis'; bib = [ ... 
'author = {Fan\c{c}ois Conand}, ' ... 
'year = {1988}, ' ...
'title = {Biologie et \''{e}cologie des poisson p\''{e}lagiques du lagon de {N}ouvell-{C}al\''{e}donie utilisables comme app\^{a}t thonier}, ' ...
'school = {INSTITUT FRAN\_c{C}AIS DE RECHERCHE SCIENTIFIQUE POUR LE D\''{E}VELOPPEMENT EN COOP\''{E}RATION}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.se/summary/Atherinomorus-lacunosus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

