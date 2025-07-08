function [data, auxData, metaData, txtData, weights] = mydata_Penitella_penita
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Pholadidae';
metaData.species    = 'Penitella_penita';
metaData.species_en = 'Flap-tip piddock'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN','MPE'};
metaData.ecoCode.habitat = {'0jMp','jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'piPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'aj';  'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};       
metaData.date_subm = [2021 02 27];                  
metaData.email    = {'bas.kooijman@vu.nl'};              
metaData.address  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 25]; 

%% set data
% zero-variate data;
data.tj = 9;      units.tj = 'd';    label.tj = 'time since birth at metamorphosis';  bibkey.tj = 'guess';   
  temp.tj = C2K(11);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2*365;      units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Evan1966';   
  temp.tp = C2K(11);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
 data.am = 21*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'sealifebase';   
  temp.am = C2K(11);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 5.2;   units.Li  = 'cm';   label.Li  = 'ultimate shell depth';           bibkey.Li  = 'EoL';

data.Wwb = 1.131e-7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 60 mum: pi/6*(0.006)^3';
data.Wwi = 103; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'guess';
  comment.Wwi = 'based on photo: SL*SD^2*pi/4 with SL=7.8cm, SD=4.1 cm';

data.Ri  = 5e6/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(11);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

%  initial length-length after 11.5 mnth
data.LL = [... % shell depth (cm), shell depth increment after 11.5 mnth
1.493	0.657
1.551	0.779
1.578	0.838
1.591	0.816
1.650	0.891
1.698	0.783
1.707	0.358
1.718	0.943
1.787	0.213
1.806	0.825
1.901	0.384
1.902	0.275
1.919	0.554
1.937	0.197
1.967	0.367
2.002	0.090
2.026	0.630
2.051	0.526
2.052	0.259
2.054	0.334
2.104	0.299
2.150	0.000
2.207	0.376
2.226	0.426
2.289	0.266
2.292	0.196
2.312	0.184
2.312	0.107
2.331	0.398];   
units.LL = {'cm', 'cm'};  label.LL = {'shell depth', 'shell depth increment after 350 d'};
temp.LL = C2K(11);  units.temp.LL = 'C'; label.temp.LL = 'temperature';
bibkey.LL = 'Evan1966';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 10 * weights.LL;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'food density is taken proportional to temperature in tL data';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'No growth after puberty, siphon can dissolve carbonate';
metaData.bibkey.F1 = 'Evan1966';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '76JYD'; % Cat of Life
metaData.links.id_ITIS = '81789'; % ITIS
metaData.links.id_EoL = '46470741'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Penitella_penita'; % ADW
metaData.links.id_Taxo = '514976'; % Taxonomicon
metaData.links.id_WoRMS = '507013'; % WoRMS
metaData.links.id_molluscabase = '507013'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pholadidae}},'...
'note = {Accessed : 2021-01-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Evan1966'; type = 'phdthesis'; bib = [ ... 
'author = {John William Evans}, ' ... 
'year = {1966}, ' ...
'title = {The ecology of the rock-boring clam \emph{Penite11a penita} ({C}onrad 1837)}, ' ...
'school = {University of Oregon}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.sealifebase.se/summary/Penitella-penita.html}},'...
'note = {Accessed : 2021-01-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = [...
'howpublished = {\url{https://eol.org/pages/46470741}},'...
'note = {Accessed : 2021-01-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

