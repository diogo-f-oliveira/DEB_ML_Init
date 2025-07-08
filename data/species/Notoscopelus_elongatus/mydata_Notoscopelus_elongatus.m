function [data, auxData, metaData, txtData, weights] = mydata_Notoscopelus_elongatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Notoscopelus_elongatus'; 
metaData.species_en = 'Lanternfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.2); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 22]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 22]; 

%% set data
% zero-variate data
data.am = 6*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Gjos1981';  
  temp.am = C2K(13.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';    bibkey.Lp = 'guess';
data.Li = 14.5;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwi = 16; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F3';

data.Ri = 2e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(13.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% time-length data
data.tL = [ ... % time since birth (yr), standard length (cm)
0.424	7.841
0.768	8.429
1.424	11.027
1.695	10.939
1.762	8.973
1.767	9.427
1.769	11.353
2.433	11.006
2.439	11.400
2.772	11.090
2.776	11.968
2.779	11.020
2.847	11.010
3.015	11.304
3.022	11.193
3.698	11.684
3.781	11.079
3.928	11.716
4.101	13.059
4.693	11.945
4.945	11.372
5.116	13.391
5.941	11.271];
data.tL(:,1) = 365 * (0.5+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(13.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gjos1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 13.6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight for Myctophum_asperum: Ww in g = 0.00389*(SL in cm)^3.12';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '47YPZ'; % Cat of Life
metaData.links.id_ITIS = '162659'; % ITIS
metaData.links.id_EoL = '46564219'; % Ency of Life
metaData.links.id_Wiki = 'Notoscopelus_elongatus'; % Wikipedia
metaData.links.id_ADW = 'Notoscopelus_elongatus'; % ADW
metaData.links.id_Taxo = '181456'; % Taxonomicon
metaData.links.id_WoRMS = '158915'; % WoRMS
metaData.links.id_fishbase = 'Notoscopelus-elongatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notoscopelus_elongatus}}';
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
bibkey = 'Gjos1981'; type = 'article'; bib = [ ...
'author = {Jakob Gj{\o}s{\ae}ter}, ' ... 
'year   = {1981}, ' ...
'title  = {LIFE HISTORY AND ECOLOGY OF THE MYCTOPHID FISH \emph{Notoscopelus elongatus kroeyeri} FROM THE {N}ORTHEAST {A}TLANTIC}, ' ...
'journal = {FiskDir. Skr. Ser. HavUnders.}, ' ...
'page = {133-152}, ' ...
'volume = {17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Notoscopelus-elongatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

