function [data, auxData, metaData, txtData, weights] = mydata_Hylarana_erythraea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Hylarana_erythraea'; 
metaData.species_en = 'Common green frog'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 06 26];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University, Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 06 26]; 


%% set data
% zero-variate data

data.am = 4*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BrowAlca1970';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.7;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'BrowAlca1970';
data.Lp  = 5.5;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'BrowAlca1970';
data.Lpm  = 3.55;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'BrowAlca1970';
data.Li  = 6.8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'BrowAlca1970';
data.Lim  = 4;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'BrowAlca1970';

data.Wwb = 0.0042;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on Anaxyrus americanus';
data.Wwp = 40;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on length-weight of Rana muscosa: (5.5/6.8)^3*76';
data.Wwpm = 10.8;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';     bibkey.Wwpm = 'guess';
  comment.Wwpm = 'guess based on length-weight of Rana muscosa: (3.55/6.8)^3*76';
data.Wwi = 76;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Rana muscosa: (6.8/6.8)^3*76';
data.Wwim = 15.4;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwim = 'guess based on length-weight of Rana muscosa: (4/6.8)^3*76';

data.Ri  = 2500/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2000 to 3000 eggs per clutch, 1 clutch per yr';
  
% univariate data
% time-length data
data.tL_f = [ ... % time since metam (yr), SVL (cm)
1.51575	    1.69669
29.66753	2.85845
60.91918	3.43031
92.12286	3.94321
122.49669	4.31615
153.53850	4.63007
183.17844	4.98097
214.15426	5.21382
245.14210	5.46141
274.74008	5.76073
304.35005	6.07479
335.19398	6.14551
366.78380	6.25301];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f   = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BrowAlca1970';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (yr), SVL (cm)
1.51575  	1.69669
30.66165	2.32034
61.81136	2.76691
91.40335	3.05885
121.67526	3.30651
154.71487	3.43598
183.44705	3.55113
213.59904	3.65140
244.47296	3.75897
274.59497	3.82239
303.27921	3.87857
334.85701	3.97133
366.39886	4.01988];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m   = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BrowAlca1970';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6MN4Y'; % Cat of Life
metaData.links.id_ITIS = '775011'; % ITIS
metaData.links.id_EoL = '313505'; % Ency of Life
metaData.links.id_Wiki = 'Hylarana_erythraea'; % Wikipedia
metaData.links.id_ADW = 'Hylarana_erythraea'; % ADW
metaData.links.id_Taxo = '996540'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hylarana+erythraea'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hylarana_erythraea}}';
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
bibkey = 'BrowAlca1970'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1442304}, ' ...
'author = {Brown, W. C. and Alcala, A. C.}, ' ... 
'year = {1970}, ' ...
'title = {Population Ecology of the Frog \emph{Rana erythraea} in Southern {N}egros, {P}hilippines}, ' ...
'journal = {Copeia}, ' ...
'volume = {1970(4)}, ' ...
'pages = {611-622}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Sylvirana+guentheri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

