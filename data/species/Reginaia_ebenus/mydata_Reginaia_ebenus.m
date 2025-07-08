function [data, auxData, metaData, txtData, weights] = mydata_Reginaia_ebenus

% http://www.debtheory.org/wiki/index.php?title=Mydata_file#Metadata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Reginaia_ebenus'; 
metaData.species_en = 'Ebonyshell'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 01]; 

%% set data
% zero-variate data

data.tp = 6*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'PaynMill1989';
  temp.tp = C2K(19.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'PaynMill1989';   
  temp.am = C2K(19.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.1;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement'; bibkey.Lj  = 'PaynMill1989'; 
data.Lp  = 3.9;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'PaynMill1989'; 
data.Li  = 8.8;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'EoL';

data.Wwb = .00000053;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Pate1985'; 
  comment.Wwb = 'data are for Elliptio complanata in Canada';
data.Wdi = 6.5;   units.Wdi = 'g';   label.Wdi = 'ultimate tissue dry weight';     bibkey.Wdi = {'EoL','PaynMill1989'};

data.Ri  = 2e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(19.5);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95'; 
 
% uni-variate data
  
% time - length
data.tL = [ ...  % time since birth (yr), shell length (cm)  
1	0.822
2	1.579
4	2.992
6	4.770];
data.tL(:,1) = data.tL(:,1) * 365 - 130; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'age', 'shell length'};
temp.tL = C2K(19.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PaynMill1989';
comment.tL = 'Data from lower Ohio River; Temperature guessed';

%% set weights for all real data
weights = setweights(data, []);
%weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k =  0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio'; weights.psd.k = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% discussion
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1); 

%% Facts
F1 = 'length-weight: Wd of tissue in g = 9.6373e-3 *(SL in cm)^3';
metaData.bibkey.F1 = 'PaynMill1989';
F2 = 'length-weight: Wd of shell in g = 8.8308e-4 *(SL in mm)^2.740';
metaData.bibkey.F2 = 'PaynMill1989';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '78SGY'; % Cat of Life
metaData.links.id_ITIS = '988186'; % ITIS
metaData.links.id_EoL = '52590399'; % Ency of Life
metaData.links.id_Wiki = 'Reginaia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5638085'; % Taxonomicon
metaData.links.id_WoRMS = '857476'; % WoRMS
metaData.links.id_molluscabase = '857476'; % molluscabase


%% References
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/449621}}';
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
bibkey = 'PaynMill1989'; type = 'Article'; bib = [ ... 
'author = {Barry S. Payne and Andrew C. Miller}, ' ... 
'year = {1989}, ' ...
'title = {Growth and Survival of Recent Recruits to a Population of \emph{Fusconaia ebena} ({B}ivalvia: {U}nionidae) in the {L}ower {O}hio {R}iver}, ' ...
'journal = {Am. Midl. Nat. :}, ' ...
'volume = {121}, ' ...
'pages = {99-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Pate1985'; type = 'Article'; bib = [ ... 
'author = {C. G. Paterson}, ' ... 
'year = {1985}, ' ...
'title = {Biomass and Production of the {U}nionid, \emph{Elliptio complanata} ({L}ightfoot) in an {O}ld {R}eservoir in {N}ew {B}runswick, {C}anada},' ...
'journal = {Freshwater Invertebrate Biology}, ' ...
'volume = {4}, ' ...
'number = {4}, '...
'pages = {201-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
