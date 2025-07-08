function [data, auxData, metaData, txtData, weights] = mydata_Sarotherodon_galilaeus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Sarotherodon_galilaeus'; 
metaData.species_en = 'Mango tilapia'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 23];

%% set data
% zero-variate data

data.am = 11*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 16.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 39.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7-2.6 mm : pi/6*0.25^3';
data.Wwp = 77;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = '2,282';
  comment.Wwp = 'based on 0.01778*Lp^3.00, see F1';
data.Wwi = 1.1e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01778*Li^3.00, see F1';

data.Ri  = 2282/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(30); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
0.735	7.647
1.062	11.750
1.470	15.013
1.913	17.903
2.613	21.164
3.267	23.166
3.967	24.841
4.573	25.397
5.332	25.999];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(30);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MeroHech1988';
comment.tL = 'data from Lake Tchad and from drawn curve';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01778*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79NR6'; % Cat of Life
metaData.links.id_ITIS = '648229'; % ITIS
metaData.links.id_EoL = '46572803'; % Ency of Life
metaData.links.id_Wiki = 'Sarotherodon_galilaeus'; % Wikipedia
metaData.links.id_ADW = 'Sarotherodon_galilaeus'; % ADW
metaData.links.id_Taxo = '571806'; % Taxonomicon
metaData.links.id_WoRMS = '293731'; % WoRMS
metaData.links.id_fishbase = 'Sarotherodon-galilaeus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sarotherodon_galilaeus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Oreochromis-mossambicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeroHech1988'; type = 'Misc'; bib = [ ... 
'title = {Growth of African freshwater fishes},'...
'author = {B. de Merona and T. Hecht and J. Moreau},'...
'year = {1988},'...
'howpublished = {\url{https://horizon.documentation.ird.fr/exl-doc/pleins_textes/pleins_textes_5/pt5/travaux_d/26396.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

