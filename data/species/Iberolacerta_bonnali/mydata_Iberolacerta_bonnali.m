function [data, auxData, metaData, txtData, weights] = mydata_Iberolacerta_bonnali
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Iberolacerta_bonnali'; 
metaData.species_en = 'Pyrenean rock lizard'; 

metaData.ecoCode.climate = {'Csa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 07];

%% set data
% zero-variate data

data.ab = 34.15;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'ArriGalan2005';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'ArriGalan2005';
  temp.tp = C2K(14); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'ArriGalan2005';
  temp.tpm = C2K(14); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 16*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'ErogBulb2018';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.58;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'ArriGalan2005';  
data.Lp  = 4.95;    units.Lp  = 'cm';  label.Lp  = 'SVL at pubdert for females';  bibkey.Lp  = 'ArriGalan2005'; 
data.Lpm  = 4.50;   units.Lpm  = 'cm';  label.Lpm  = 'SVL at pubdert for males'; bibkey.Lpm  = 'ArriGalan2005'; 
data.Li  = 6.54;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'ArriGalan2005'; 
data.Lim  = 5.87;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males'; bibkey.Lim  = 'ArriGalan2005'; 

data.Wwb = 0.46;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'ArriGalan2005';
data.Wwi = 5.12;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'EoL';


% univariate data
% length-fecundity
data.LN = [ ... % SVL (cm), fecundity (#)
5.136	2.004
5.408	3.051
5.414	4.004
5.446	2.006
5.495	2.007
5.534	2.007
5.554	2.959
5.573	2.007
5.641	2.978
5.670	2.978
5.714	2.997
5.748	2.998
5.752	2.027
5.758	4.006
5.812	4.006
5.835	2.998
5.933	3.969
6.229	2.982
6.419	4.010];
units.LN  = {'cm', '#'};  label.LN = {'SVL', 'fecundity'};  
temp.LN   = C2K(14);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ArriGalan2005'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Lives at 1900 to > 3000 m alt in the Pyrenees; 4 mnth season';
metaData.bibkey.F1 = 'ArriGalan2005'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3P7HF'; % Cat of Life
metaData.links.id_ITIS = '1155314'; % ITIS
metaData.links.id_EoL = '47045523'; % Ency of Life
metaData.links.id_Wiki = 'Iberolacerta_bonnali'; % Wikipedia
metaData.links.id_ADW = 'Iberolacerta_bonnali'; % ADW
metaData.links.id_Taxo = '1685266'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Iberolacerta&species=bonnali'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Iberolacerta_bonnali}}';
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
bibkey = 'ArriGalan2005'; type = 'Article'; bib = [ ...
'doi = {10.1163/1570756053993505}, ' ...
'author = {Arribas, Oscar and Gal\''{a}n, Pedro}, ' ... 
'year = {2005}, ' ...
'title = {Reproductive characteristics of the {P}yrenean high-mountain lizards: \emph{Iberolacerta aranica} ({A}rribas, 1993), \emph{I. aurelioi} ({A}rribas, 1994) and \emph{I. bonnali} ({L}antz, 1927)}, ' ...
'journal = {Animal Biology}, ' ...
'volume = {55(2)}, ' ...
'pages = {163–190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/47045523}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

