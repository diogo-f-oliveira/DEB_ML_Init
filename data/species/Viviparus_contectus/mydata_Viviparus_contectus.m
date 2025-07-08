function [data, auxData, metaData, txtData, weights] = mydata_Viviparus_contectus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Viviparidae';
metaData.species    = 'Viviparus_contectus'; 
metaData.species_en = 'Lister''s river snail'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFm'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 15]; 

%% set data
% zero-variate data

data.ab = 25; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Poel1958';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.4;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'Poel1958';
data.Lp  = 2.119; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Poel1958';
data.Li  = 4.17;  units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'EoL';

data.Ri  = 55/365; units.Ri  = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'Poel1958';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % age (yr), shell length (cm)
0	0.436
1	1.289
2	1.686
3	2.318
4	3.091
5	3.530
6	4.006];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time birth', 'shell length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Poel1958';

% length - weight
data.LWw = [ ... % shell length (cm), wet weight (g)
2.7  6.0
3.0  6.9
4.0 14.5
4.4 17.4];
units.LWw   = {'cm', 'g'};  label.LWw = {'shell length', 'wet weight'};  
bibkey.LWw = 'UvaeShch2017';
comment.LWw = 'Weight probably includes shell';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.LWw = 3 * weights.LWw;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'males are slightly smaller than females';
metaData.bibkey.F1 = {'Poel1958','Wiki'}; 
F2 = 'filter feeder through siphon';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5BNDW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3035216'; % Ency of Life
metaData.links.id_Wiki = 'Viviparus_contectus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '35156'; % Taxonomicon
metaData.links.id_WoRMS = '154006'; % WoRMS
metaData.links.id_molluscabase = '154006'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Viviparus_viviparus}}';
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
bibkey = 'Poel1958'; type = 'Article'; bib = [ ... 
'author = {S. van der Poel}, ' ... 
'year = {1958}, ' ...
'title = {Groei en ouderdom bij \emph{Viviparus contectus} ({M}illet, 1813) en \emph{Viviparus viviparus} ({L}inn\''{e}, 1758)}, ' ...
'journal = {Basteria}, ' ...
'volume = {22}, ' ...
'pages = {77-90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UvaeShch2017'; type = 'Article'; bib = [ ... 
'author = {E. I. Uvaeva and G. Kh. Shcherbina}, ' ... 
'year = {2017}, ' ...
'title = {The Role of \emph{Viviparus contectus} ({M}illet) ({M}ollusca, {V}iviparidae) in the Sedimentation of Suspension and Transformation of Organic Matter in the {T}nya {R}iver ({U}kraine)}, ' ...
'journal = {Inland Water Biology}, ' ...
'number = {4}, ' ...
'volume = {10}, ' ...
'pages = {415-418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/3035216}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
