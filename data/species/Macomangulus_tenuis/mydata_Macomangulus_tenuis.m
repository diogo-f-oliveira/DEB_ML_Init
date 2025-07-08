function [data, auxData, metaData, txtData, weights] = mydata_Macomangulus_tenuis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Tellinidae';
metaData.species    = 'Macomangulus_tenuis'; 
metaData.species_en = 'Thin tellin'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 23]; 


%% set data
% zero-variate data

data.ab = 52/24;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(13);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'DekkBeuk1999';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.2;   units.Lj  = 'cm';  label.Lj  = 'shell length at metam';    bibkey.Lj  = 'guess';
data.Lp  = 1.0;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty';    bibkey.Lp  = 'guess';
data.Li  = 3.0;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';      bibkey.Li  = 'sealifebase';

data.Wwb = 1.44e-07;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based from guessed egg diameter of 65 mum: pi/6*0.0065^3';
data.Wdi = 0.13;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Macoma baltica';

data.Ri  = 797424/365; units.Ri  = '#/d';     label.Ri  = 'maximum reprod rate at SL 3 cm';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% t-L data
data.tL = [ ... %  time since birth (yr), shell length (cm)
0.000	0.056
0.848	0.070
1.263	0.856
1.264	0.871
1.276	0.744
1.277	0.774
1.772	1.008
1.800	0.952
1.842	0.886
1.857	1.034
2.268	1.462
2.269	1.493
2.270	1.564
2.284	1.620
2.794	1.747
2.806	1.604
2.807	1.625
2.808	1.681
3.205	2.017
3.218	1.910
3.232	1.874
3.246	1.818
3.783	1.879
3.797	1.966
3.798	2.012
4.250	2.139
4.264	2.067
4.279	2.129
4.801	2.067
4.802	2.138
5.253	2.158
5.268	2.240
5.775	2.153
6.241	2.147];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DekkBeuk1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures (in C) are assumed to vary in time (in d) as T(t)=10+6*sin(2*pi*(t-250)/365))';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Incidentically protandric hermaphrodites';
metaData.bibkey.F1 = 'sealifebase'; 
F2 = 'Tellinidae have heamoglobine/myoglobine in their nerves and muscles, which colors them red';
metaData.bibkey.F2 = 'swg'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WZYF'; % Cat of Life
metaData.links.id_ITIS = '81122'; % ITIS
metaData.links.id_EoL = '46474290'; % Ency of Life
metaData.links.id_Wiki = 'Tellina_tenuis'; % Wikipedia
metaData.links.id_ADW = 'Tellina_tenuis'; % ADW
metaData.links.id_Taxo = '5485385'; % Taxonomicon
metaData.links.id_WoRMS = '878470'; % WoRMS
metaData.links.id_molluscabase = '878470'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tellina_tenuis}}';
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
bibkey = 'DekkBeuk1999'; type = 'Article'; bib = [ ... 
'author = {R. Dekker and J.J. Beukema}, ' ... 
'year = {1999}, ' ...
'title = {Relations of summer and winter temperatures with dynamics and growth of two bivalves, \emph{Tellina tenuis} and \emph{Abra tenuis}, on the northern edge of their intertidal distribution}, ' ...
'doi = {10.3389/fmars.2020.582703}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {42}, ' ...
'pages = {207-220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'swg'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.strandwerkgemeenschap.nl/tweekleppigen/tere_platschelp/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Tellina-tenuis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6493}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
