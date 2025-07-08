function [data, auxData, metaData, txtData, weights] = mydata_Prionotus_evolans
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Prionotus_evolans'; 
metaData.species_en = 'Striped searobin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.7); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L_f';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 19]; 

%% set data
% zero-variate data
data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'guess';    
  temp.ab = C2K(12.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(12.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 22.1;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 45;    units.Li = 'cm';   label.Li = 'ultimate total length';          bibkey.Li = 'fishbase';

data.Wwb = 8.0e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Yusc1985';
  comment.Wwb = 'based on egg diameter of 1.05-1.25 mm: pi/6*0.115^3';
data.Wwp = 71.7;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00776*Lp^2.95, see F1';
data.Wwi = 584; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00776*Li^2.95, see F1, max published weight 1.6 kg';

% uni-variate data
% time-length
data.tL_CN = [ ... % age (years) ~ Length (cm) 
    0 NaN   9.0
    1 13.2 16.0
    2 18.6 21.0
    3 20.7 23.5
    4 22.4 26.0
    5 24.5 29.0
    6 27.0 30.5];
data.tL_CN(:,1) = 365 * (0.8+data.tL_CN(:,1)); % convert yr to d
units.tL_CN = {'d', 'cm'}; label.tL_CN = {'time since birth', 'total length'};  
treat.tL_CN = {1, {'Chesapeak','New England'}};
temp.tL_CN = C2K(12.7);  units.temp.tL_CN = 'K'; label.temp.tL_CN = 'temperature';
bibkey.tL_CN = 'McBr2002';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#) 
21.004	89161.728
21.455	101503.514
21.474	114108.653
21.600	98344.965
22.160	107045.072
22.252	117707.300
22.746	110410.595
22.782	140469.457
23.136	124694.723
23.147	128815.427
23.154	140209.005
23.189	112086.084
23.200	144085.544
23.309	141413.596
23.332	115957.979
23.438	150134.643
23.451	116194.590
23.504	163949.606
23.867	126356.259
23.916	183808.427
24.307	104516.724
24.541	150081.159
24.554	117110.818
24.635	155167.516
24.663	114438.874
26.076	179582.495];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(12.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Yusc1985';
comment.LN = 'Data from  Long Island Sound';

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

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00776*(TL in cm)^2.95';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MGG4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46568731'; % Ency of Life
metaData.links.id_Wiki = 'Prionotus_evolans'; % Wikipedia
metaData.links.id_ADW = 'Prionotus_evolans'; % ADW
metaData.links.id_Taxo = '184723'; % Taxonomicon
metaData.links.id_WoRMS = '159572'; % WoRMS
metaData.links.id_fishbase = 'Prionotus-evolans'; % fishbase184723

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prionotus_evolans}}';
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
bibkey = 'McBr2002'; type = 'article'; bib = [ ...
'author = {Richard S. McBride}, ' ... 
'year   = {2002}, ' ...
'title  = {Spawning, growth, and overwintering size of searobins ({T}riglidae: {\it Prionotus carolinus} and {\it P. evolans})}, ' ...
'journal = {Fishery Bulletin}, ' ...
'page = {641-647}, ' ...
'volume = {100(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Yusc1985'; type = 'article'; bib = [ ...
'author = {Paul Yuschak}, ' ... 
'year   = {1985}, ' ...
'title  = {Fecundity, Eggs, Larvae and Osteological Development of the Striped Searobin, ({\it Prionotus evolans}) ({P}isces, {T}riglidae))}, ' ...
'journal = {J Northw Atl Fish. Sci}, ' ...
'page = {65-85}, ' ...
'volume = {6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Prionotus-evolans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

