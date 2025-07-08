function [data, auxData, metaData, txtData, weights] = mydata_Dosinia_exoleta

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Veneridae';
metaData.species    = 'Dosinia_exoleta'; 
metaData.species_en = 'Rayed dosinia'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 17]; 


%% set data
% zero-variate data

data.ab = 3.5;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess';
  comment.Lp = 'guess based on same relative length, compared to Ruditapes_philippinarum: 6/5*1 cm ';
data.Li  = 6;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';      bibkey.Li  = 'Wiki';

data.Wwb = 5.2e-07;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'Computed from guessed egg diameter of 100 mum: 4/3*pi*(0.01/2)^3';
data.Wwp = 0.13;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'guess';
  comment.Wwp = 'Computed as 0.07*Lp^3.398, see F1';
data.Wwi = 30.85;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'GaspSant2001','Wiki'};
  comment.Wwi = 'based on 0.07*Li^3.398, see F1';

data.Ri  = 1e7/365; units.Ri  = '#/d';     label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-L data
data.tL_Ave = [ ... %  time since birth (yr), shell length (cm)
1 1.27
2 2.18
3 2.61
4 3.07
5 3.35
6 3.62 
7 3.85
8 4.01];
data.tL_Ave(:,1) = data.tL_Ave(:,1) * 365; % convert yr to d
units.tL_Ave   = {'d', 'cm'};  label.tL_Ave = {'time since settlement', 'shell length'};  
temp.tL_Ave    = C2K(15.4);  units.temp.tL_Ave = 'K'; label.temp.tL_Ave = 'temperature';
bibkey.tL_Ave = 'MourVasc2013';
comment.tL_Ave = 'Data from Avairo; aging by acetate peels';
%
data.tL_Set = [ ... %  time since birth (yr), shell length (cm)
1 1.32
2 1.98
3 2.76
4 3.36
5 3.71
6 3.92
7 4.01
8 4.23
9 4.44];
data.tL_Set(:,1) = data.tL_Set(:,1) * 365; % convert yr to d
units.tL_Set   = {'d', 'cm'};  label.tL_Set = {'time since settlement', 'shell length'};  
temp.tL_Set    = C2K(17.3);  units.temp.tL_Set = 'K'; label.temp.tL_Set = 'temperature';
bibkey.tL_Set = 'MourVasc2013';
comment.tL_Set = 'Data from Setubal; aging by acetate peels';
%
data.tL_Far = [ ... %  time since birth (yr), shell length (cm)
1 1.60
2 2.66
3 3.31
4 3.69
5 3.92
6 4.12];
data.tL_Far(:,1) = data.tL_Far(:,1) * 365; % convert yr to d
units.tL_Far   = {'d', 'cm'};  label.tL_Far = {'time since settlement', 'shell length'};  
temp.tL_Far    = C2K(20.2);  units.temp.tL_Far = 'K'; label.temp.tL_Far = 'temperature';
bibkey.tL_Far = 'MourVasc2013';
comment.tL_Far = 'Data from Faro; aging by acetate peels';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Far','tL_Set','tL_Ave'}; subtitle1 = {'Data from Faro, Setubal, Avairo'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Weight (g)- shell length (cm): 0.07*L^3.398';
metaData.bibkey.F1 = {'GaspSant2001'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DK9Q'; % Cat of Life
metaData.links.id_ITIS = '81491'; % ITIS
metaData.links.id_EoL = '46469344'; % Ency of Life
metaData.links.id_Wiki = 'Dosinia_exoleta'; % Wikipedia
metaData.links.id_ADW = 'Dosinia_exoleta'; % ADW
metaData.links.id_Taxo = '39650'; % Taxonomicon
metaData.links.id_WoRMS = '141911'; % WoRMS
metaData.links.id_molluscabase = '141911'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dosinia_exoleta}}';
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
bibkey = 'MourVasc2013'; type = 'Article'; bib = [ ... 
'author = {P. Moura and P. Vasconcelos and M. B. Gaspa}, ' ... 
'year = {2013}, ' ...
'title = {Age and growth in three populations of \emph{Dosinia exoleta} ({B}ivalvia: {V}eneridae) from the {P}ortuguese coast}, ' ...
'doi = {10.1007/s10152-013-0350-7}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {67}, ' ...
'pages = {639-652}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaspSant2001'; type = 'Article'; bib = [ ... 
'author = {Gaspar, M. B. and Santos, M. N. and Vasconcelos, P.}, ' ... 
'year = {2001}, ' ...
'title = {Weight-length relationships of 25 bivalve species ({M}ollusca: {B}ivalvia) from the {A}lgarve coast (southern {P}ortugal)}, ' ...
'journal = {J Mar biol Ass UK}, ' ...
'volume = {81}, ' ...
'pages = {805-807}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46469344}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

